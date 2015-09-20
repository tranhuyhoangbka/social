FactoryGirl.define do
  factory :post, aliases: [:text_post] do
    title {Faker::Name.title}
    body {Faker::Lorem.sentences}
    type "TextPost"
    user_id {[1, 2].sample}

    factory :image_post do
      type "ImagePost"
      url {Faker::Avatar.image}
    end
  end
end
