class BlocksController < ApplicationController
  def show
    @block = Story.find_by_id(params[:story_id]).blocks.find_by_block_number(params[:block_id])
    render_success({"block" => @block})
  end
end
