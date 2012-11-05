# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)
@story = Story.create(:title => "Meow")
#Block.create!(:story_id => @story.id, :block_number => 0, :text => "The cat likes us, however there are things that you need to know about the cat, for example")
#Block.create!(:story_id => @story.id, :block_number => 1, :text => "the cat is a heavy drinker, and has been found to be friends with a sheep who's reputation does indeed")
#Block.create!(:story_id => @story.id, :block_number => 2, :text => "proceed himself. An irish sheep, known by the name of sheepa is a dangerous sheep to say the least. But his biggest")
#Block.create!(:story_id => @story.id, :block_number => 3, :text => "threat is to himself.")
#
Block.create!(:story => @story, :block_number => 0, :text => "The cat likes us, however there are things that you need to know about the cat, for example")
Block.create!(:story => @story, :block_number => 1, :text => "the cat is a heavy drinker, and has been found to be friends with a sheep who's reputation does indeed")
Block.create!(:story => @story, :block_number => 2, :text => "proceed himself. An irish sheep, known by the name of sheepa is a dangerous sheep to say the least. But his biggest")
Block.create!(:story => @story, :block_number => 3, :text => "threat is to himself.")


@nalin = User.create(:first_name => "Nalin",
                     :last_name => "De Zoysa")

@story2 = Story.create_with_blocks(:title => "Meow again",
                                   :text => "You've got your ball 
                                   You've got your chain 
                                   Tied to me tight tie me up again 
                                   Who's got their claws 
                                   In you my friend 
                                   Into your heart I'll beat again 
                                   Sweet like candy to my soul 
                                   Sweet you rock 
                                   And sweet you roll 
                                   Lost for you I'm so lost for you 

                                   You come crash into me 
                                   And I come into you 
                                   I come into you 
                                   In a boys dream 
                                   In a boys dream 

                                   Touch your lips just so I know 
                                   In your eyes, love, it glows so 
                                   I'm bare boned and crazy for you 
                                   When you come crash 
                                   Into me, baby 
                                   And I come into you 
                                   In a boys dream 
                                   In a boys dream 

                                   If I've gone overboard 
                                   Then I'm begging you 
                                   To forgive me 
                                   In my haste 
                                   When I'm holding you so girl 
                                   Close to me 

                                   Oh and you come crash 
                                   Into me, baby 
                                   And I come into you 
                                   Hike up your skirt a little more 
                                   And show the world to me 
                                   Hike up your skirt a little more 
                                   And show your world to me 
                                   In a boys dream.. In a boys dream 

                                   Oh I watch you there 
                                   Through the window 
                                   And I stare at you 
                                   You wear nothing but you 
                                   Wear it so well 
                                   Tied up and twisted 
                                   The way I'd like to be 
                                   For you, for me, come crash 
                                   Into me 
                                   ",
                                   :user => @nalin)
