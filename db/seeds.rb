# frozen_string_literal: true

# Clear existing data
User.destroy_all
Tweet.destroy_all

# Create users
emails = %w[admin john samanta sam david michael]
users = []
emails.each do |email|
  users << User.create!(
    email: "#{email}@example.com",
    username: email,
    password: 'password'
  )
end

# Create tweets
tweets = []
users.each do |user|
  2.times do
    tweets << Tweet.create!(
      content: Faker::Lorem.sentence(word_count: 10),
      user: user
    )
  end
end

puts 'Seeding completed successfully.'
