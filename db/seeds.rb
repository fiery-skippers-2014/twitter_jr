require 'faker'

1.times do
  User.create(
    name: Faker::Internet.user_name,
    email: Faker::Internet.email,
    password_hash: Faker::Name.first_name
    )
end

1.times do
  Tweet.create(
    tweet: Faker::Lorem.sentence,
    user_id: rand(1..10)
    )

end
