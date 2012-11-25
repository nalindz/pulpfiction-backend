class TagsController < ApplicationController
  def create
    @story = Story.find(params[:story_id])
    @old_taglist = @story.tags
    old_taglist_text = @old_taglist.map {|t| t.text}


    @new_taglist = params[:tag_list];
    new_taglist_text = @new_taglist.map {|t| t[:text]}

    @tags_to_add = @new_taglist.reject{|t| old_taglist_text.include? t[:text]}

    @tags_to_remove = @old_taglist.reject{|t| new_taglist_text.include? t.text}

    @tags_to_add.each{ |t|
      @story.tags.create!(:text => t[:text])
    }

    @tags_to_remove.each {|t|
      Tag.where(:text => t.text, :story_id => @story.id).delete_all
    }
    render_success
  end

end
