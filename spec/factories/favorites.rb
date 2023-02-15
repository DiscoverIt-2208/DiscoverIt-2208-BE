FactoryBot.define do
  factory :favorite, class: Favorite do
    ninja_id { "#{Faker::Number.number(digits: 10)}" }
    place_name { Faker::Fantasy::Tolkien.location }
    thumbnail_url { Faker::Lorem.sentence }
    association :user, factory: :user  
  end
end
