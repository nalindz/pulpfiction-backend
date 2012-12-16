@nalin = User.create(:first_name => "Nalin",
                     :last_name => "De Zoysa")

for i in 1..21 do
  story_text = IO.read("seeds/story#{i}.txt")
  @story = Story.create_with_blocks(:title => "Story #{i}", 
                                    :text => story_text, 
                                    :cover_image => File.open("seeds/images/#{i}.jpg"),
                                    :user => @nalin)
end
