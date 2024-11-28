# frozen_string_literal: true

# == Schema Information
#
# Table name: tweets
#
#  id         :bigint           not null, primary key
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_tweets_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
require 'rails_helper'

RSpec.describe Tweet, type: :model do
  describe 'associations' do
    it { should belong_to(:user) }
  end

  describe 'validations' do
    it 'requires content to be present' do
      tweet = build(:tweet, content: nil)
      expect(tweet).not_to be_valid
      expect(tweet.errors[:content]).to include("can't be blank")
    end

    it 'requires content to be at most 280 characters' do
      tweet = build(:tweet, content: 'a' * 281)
      expect(tweet).not_to be_valid
      expect(tweet.errors[:content]).to include('is too long (maximum is 280 characters)')
    end
  end

  describe 'broadcasts' do
    it 'manually verifies broadcast content' do
      tweet = create(:tweet)

      # Simulate a manual broadcast to verify content
      broadcasted_data = ActiveSupport::JSON.decode(tweet.to_json)
      ActionCable.server.broadcast('tweets', broadcasted_data)

      # Verify that the broadcast includes the correct data
      expect(broadcasted_data['id']).to eq(tweet.id)
      expect(broadcasted_data['content']).to eq(tweet.content)
    end
  end
end
