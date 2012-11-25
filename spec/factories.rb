FactoryGirl.define do
  factory :user do
    sequence(:first_name) {|n| "john#{n}" }
    sequence(:last_name) {|n| "doe#{n}" }
  end


  factory :story do
    sequence(:title) {|n| "Sample Story Title #{n}" }
    association :user


    #TODO: this story doesn't have any blocks :O
  end
end
