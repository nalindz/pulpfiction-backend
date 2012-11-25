require 'spec_helper'

describe TagsController do
  before do
    @user = FactoryGirl.create(:user)
    @story = FactoryGirl.create(:story)
    login_as(@user)
  end

  describe 'create' do

    it 'should add new tags to a story' do
      tag_list = [{:text => 'Romance'},
                  {:text => 'Mystery'}]

      post :create, :tag_list => tag_list, :story_id => @story.id
      response.should be_success
      @story.tags.count.should == tag_list.count



      tag_list2 = [{:text => 'Horror'},
                  {:text => 'Mystery'}]


      post :create, :tag_list => tag_list2, :story_id => @story.id
      response.should be_success

      assigns(:tags_to_add).count.should == 1
      assigns(:tags_to_add).should == [{'text' => 'Horror'}]

      assigns(:tags_to_remove).count.should == 1

      @story.tags.count.should == 2


      tag_list3 = [{:text => 'Horror'},
                  {:text => 'Mystery'}, 
                  {:text => "Comedy"}]


      post :create, :tag_list => tag_list3, :story_id => @story.id
      response.should be_success

      assigns(:tags_to_add).count.should == 1
      assigns(:tags_to_add).should == [{'text' => 'Comedy'}]

      assigns(:tags_to_remove).count.should == 0

      @story.tags.count.should == 3

    end
  end

end
