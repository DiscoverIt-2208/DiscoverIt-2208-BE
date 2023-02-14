FactoryBot.define do
  factory :user, class: User do
    name { Faker::Movies::HarryPotter.character }
    email { Faker::Internet.email }
    password { Faker::Internet.password }
  end
end
