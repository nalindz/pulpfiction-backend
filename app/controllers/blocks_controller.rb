class BlocksController < ApplicationController
  def index
    if (params[:first_block].nil? or params[:last_block].nil?)
      @block = Story.find_by_id(params[:story_id]).blocks.find_by_block_number(params[:id])
      render_success({:block => @block})
    else
      @blocks = Story.find_by_id(params[:story_id]).blocks.where(:block_number => params[:first_block]..params[:last_block])
      render_success(@blocks.map { |b| {:block => b }})
    end
  end
end
