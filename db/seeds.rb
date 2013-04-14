@usernames = ['hellomeow', 'jellosea', 'audiomimic', 'phoenix', 'azmanian', 'anotherUser']

@users = []
@usernames.each do |username|
  @users << user = User.create!(first_name: 'meow', last_name: 'zilla', username: username)
#  if username == 'jellosea'
#    user.facebook_id = 122615609
#    user.save!
#  end
end

@story_titles = ['Key To The Highway', 
                 'Riding With The King',
                 '50 Shades of Meow',
                 'The Hunger Meows',
                 'Say Anything',
                 'A Song of Fire and Meow',
                 'Around The World',
                 'Hate it or Love it',
                 'Message in a Bottle',
                 'Surviving the Times',
                 'Television Rules The Nation']

@tags = ['comedy', 
  'romance', 
  'anotherTag', 
  'wtf', 
  'mystery', 
  'TwistAtTheEnd', 
  'oldschool', 
  'neoPoetry',
  'experimental',
  'chickLit',
  'newschool']

@stories = []
@images = []
for i in 1..21 do
  @stories << IO.read("seeds/story#{i}.txt")
  @images << File.open("seeds/images/#{i}.jpg")
end

for i in 1..21 do
  story_text = @stories.sample
  @story = Story.create_with_blocks(:title => @story_titles.sample,
                                    :text => story_text, 
                                    :tags => @tags.sample(rand(3) + 3).map{ |t| '#' + t}.join(' '),
                                    :cover_image => @images[i],
                                    :user => @users.sample)
end
