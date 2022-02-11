FactoryBot.define do
  factory :director do
    name { Faker::Name.name }
    age { rand(100) }
  end

  factory :movie do
    title { Faker::Movie.title }
    director
    year { Faker::Date.backward(days: 10*365).year.to_s }
  end
end
