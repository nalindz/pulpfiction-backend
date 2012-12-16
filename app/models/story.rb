class Story < ActiveRecord::Base
  include Tire::Model::Search
  include Tire::Model::Callbacks

  attr_accessible :user, :title, :cover_image
  belongs_to :user
  has_many :blocks
  has_many :tags

  mount_uploader :cover_image, CoverUploader

  def self.create_with_blocks(params = {})
    story = Story.create!(params.except :text)
    params = params.reverse_merge({:block_size => 100})
    blocks = params[:text].split(/ +/).in_groups_of(params[:block_size])
    total_start_index = 0
    blocks.each_with_index{ |block, i|
      text = block.join(' ')
      text = text.gsub(/ +\n/, "\n").gsub(/\n +/, "\n")
      text = " " + text unless i == 0
      params = {:text => text, :block_number => i}
      params = params.merge({:first_block => true }) if i == 0
      params = params.merge({:last_block => true }) if i == (blocks.length - 1)
      params = params.merge({total_start_index: total_start_index})
      total_start_index += text.length
      story.blocks.create!(params)
    }
    story.total_length = total_start_index
    story.save!
    return story
  end


  def as_json(options={})
    self.attributes.merge({
      blocks_count: blocks.count, # TODO: counter_cache
      cover_url: Rails.configuration.base_url + cover_image.url
    })
  end
end
