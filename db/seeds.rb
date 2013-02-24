@usernames = ['hellomeow', 'jellosea', 'audiomimiC2001', 'phoenix', 'touchmyBody', 'anotherUser']

@users = []
@usernames.each do |username|
  @users << user = User.create!(username: username)
  if username == 'jellosea'
    user.facebook_id = 122615609
    user.save!
  end
end

@story_titles = ['We belong together', 
                 'Boulevard of Broken Dreams',
                 '50 Shades of Meow',
                 'The Hunger Meows',
                 'The Third Wheel (Diary of a cat)',
                 'A Song of Fire and Meow',
                 'Proof of Heaven',
                 'Hate it or Love it',
                 'Touch My Body: Dizitial']

@tags = ['comedy', 
  'romance', 
  'wtf', 
  'mystery', 
  'TwistAtTheEnd', 
  'NewShit', 
  'oldschool', 
  'gpoetry',
  'chickLit',
  'saxy',
  'newschool']

for i in 1..21 do
  story_text = IO.read("seeds/story#{i}.txt")
  @story = Story.create_with_blocks(:title => @story_titles.sample,
                                    :text => story_text, 
                                    :tags => @tags.sample(rand(3) + 3).map{ |t| '#' + t}.join(' '),
                                    :cover_image => File.open("seeds/images/#{i}.jpg"),
                                    :user => @users.sample)
end
