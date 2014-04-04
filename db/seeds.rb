
1.times do
  User.create(
    name: "Bob",
    email: "abc@abc.com",
    password_hash: "123456"
    )
end

1.times do
  Tweet.create(
    tweet: "Beautiful day",
    user_id: rand(1..10)
    )

end
