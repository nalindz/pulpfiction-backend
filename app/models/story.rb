class Story < ActiveRecord::Base
  attr_accessible :user, :title
  belongs_to :user
  has_many :blocks

  include Tire::Model::Search
  include Tire::Model::Callbacks

  def self.create_with_blocks(params = {})
    params = params.reverse_merge({:block_size => 100})
    story = Story.create!(:title => params[:title], :user => params[:user])
    blocks = params[:text].split(/ +/).in_groups_of(params[:block_size])
    blocks.each_with_index{ |block, i|
      text = block.join(' ')
      text = text.gsub(/ +\n/, "\n").gsub(/\n +/, "\n")
      text = " " + text unless i == 0
      params = {:text => text, :block_number => i}
      params = params.merge({:first_block => true }) if i == 0
      params = params.merge({:last_block => true }) if i == (blocks.length - 1)
      story.blocks.create!(params)
    }
    return story
  end
end
