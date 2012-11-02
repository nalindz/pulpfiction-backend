require 'spec_helper'

describe StoriesController do
  before do
    @user = FactoryGirl.create(:user)
    login_as(@user)
  end


  describe 'create' do
    it 'should create a story and split the text up into blocks' do
      @story_title = "New Story"
      @text = "So welcome to the story of my life
      See I'm tryna get right off the shit that I write
      Make a fortune, buy some Porsches for my momma and the wife
      Pop's engine in this old school run tight!
      But as you listening to K. D-O-T
      Me and my girl split the bucket at KFC
      She listening to Drake and all I can say
      Damn, these niggas that much better than me?
      Baby, I don't think this is meant to be
      cause I'm always losing self-esteem
      She paused the iPhone, then said huh
      I repeated what I said, then she replied shut up
      You know you the best boy, you gotta keep doing it
      But don't forget when you do, just keep you in it
      And never listen to what the industry say
      Don't be a typical artist, be more like Jay
      Russell, Barry Gordy, Quincy Jones
      Bob Johnson, Sean Combs, L.A. Reid
      Young black entrepreneurs did what it took to succeed, yeah
      So I gotta see success
      I gotta make it off them Rosecrans steps
      Rising to the top like a soda shook up
      Bout to pop, and I'll pop on whoever's in my way"

      post :create, :title => @story_title,  :text => @text, :format => 'json'
      response.should be_success
      assigns(:story).title.should == @story_title
      blocks = assigns(:story).blocks
      blocks.each {|b| puts 'meow:', b.text }
      assigns(:story).blocks.count.should_not == 0
      puts assigns(:story).blocks.count

    end
  end

end
