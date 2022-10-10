FactoryBot.define do
  factory :course do
    title { Faker::Hobby.activity}
    lecturer { Faker::FunnyName.name }
    description { Faker::Lorem.paragraph  }
  end
end




