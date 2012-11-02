class StoriesController < ApplicationController
  def create
    block_size = 10 # words
    blocks = params[:text].split(" ").in_groups_of(block_size)

    @story = Story.create!(:title => params[:title])
    blocks.each_with_index{ |block, i|
      @story.blocks.create!(:text => block.join(' '), 
                            :block_number => i)
    }
    render_success({"story" => @story})
  end
end
