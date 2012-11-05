class Story < ActiveRecord::Base
  attr_accessible :user, :title
  belongs_to :user
  has_many :blocks

  def self.create_with_blocks(params = {})
    params = params.reverse_merge({:block_size => 10})
    story = Story.create!(:title => params[:title], :user => params[:user])
    blocks = params[:text].split(" ").in_groups_of(params[:block_size])
    blocks.each_with_index{ |block, i|
      story.blocks.create!(:text => block.join(' '), 
                            :block_number => i)
    }
    return story
  end
end
