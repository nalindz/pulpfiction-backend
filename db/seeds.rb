@usernames = ['hellomeow', 'jellosea', 'audiomimic', 'phoenix', 'azmanian', 'anotherUser']

@users = []
@usernames.each do |username|
  @users << user = User.create!(first_name: 'meow', last_name: 'zilla', username: username)
  if username == 'jellosea'
    user.facebook_id = 122615609
    user.save!
  end
end

@stories_to_create = [
  {title: 'Tomorrow', image: 'tomorrow.jpg'},
  {title: 'Off The Deep End', image: 'off_the_deep_end.jpg'},
  {title: 'Sparks', image: 'sparks.png'},
  {title: "Don't Look Back", image: 'dont_look_back.jpg'},
  {title: 'Are We Alone', image: 'are_we_alone.jpg'},
  {title: 'Headshot', image: 'headshot.jpg'},
  {title: 'Storms To Come', image: 'storms_to_come.jpg'},
  {title: 'Night Lights', image: 'night_lights.jpg'},
  {title: 'One Last Hit', image: 'one_last_hit.jpg'},


  {title: 'Faded Memories', image: 'faded_memories.jpg'},
  {title: 'Hard Times Are Ahead', image: 'hard_times_are_ahead.jpg'},
  {title: 'Rush Hour', image: 'rush_hour.jpg'},
  {title: 'Blinded By The Lights', image: 'blinded_by_the_lights.jpg'},
  {title: 'Fly Away', image: 'fly_away.jpg'},
  {title: 'The Road Home', image: 'the_road_home.jpg'},
  {title: 'Inside Out', image: 'inside_out.jpg'},
  {title: 'Twenty/Twenty', image: 'twenty_20.png'},
  {title: "Inside It's Not Right", image: 'inside_its_not_right.jpg'},
  {title: 'Natural High', image: 'natural_high.jpg'},
  {title: 'Unavailable Utopia', image: 'unavailable_utopia.jpg'},
  {title: 'Melancholy', image: 'melancholy.jpg'},
  {title: 'As Far As The Eye Can See', image: 'as_far_as_the_eye_can_see.jpg'},

  {title: 'A Room With A View', image: 'a_room_with_a_view.jpg'},
  {title: 'No Way Out', image: 'no_way_out.jpg'},
  {title: 'Round And Round', image: 'round_and_round.png'},
  {title: 'Desert Nights', image: 'desert_nights.jpg'},
  {title: 'Mad Skillz', image: 'mad_skillz.jpg'},
  {title: 'Mr. Bugito', image: 'mr_bugito.jpg'},

  {title: 'Samsara', image: 'samsara.jpg'},
]


@tags = ['comedy', 
  'anotherTag', 
  'suspense', 
  'haikuFiction', 
  'hashTag', 
  'wtf', 
  'mystery', 
  'twistAtTheEnd', 
  'oldschool', 
  'neoPoetry',
  'experimental',
  'newschool']

@stories = []
for i in 1..21 do
  @stories << IO.read("seeds/story#{i}.txt")
end

@stories_to_create.each do |story_details|
  story_text = @stories.sample
  @story = Story.create_with_blocks(:title => story_details[:title],
                                    :text => story_text, 
                                    :tags => @tags.sample(rand(3) + 3).map{ |t| '#' + t}.join(' '),
                                    :cover_image => File.open("seeds/images/#{story_details[:image]}"),
                                    :views_count => rand(42 - 10) + 10,
                                    :bookmarks_count => rand(15),
                                    :user => @users.sample)
end
