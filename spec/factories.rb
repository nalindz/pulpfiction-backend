FactoryGirl.define do
  factory :user do
    sequence(:first_name) {|n| "john#{n}" }
    sequence(:last_name) {|n| "doe#{n}" }
  end
end
