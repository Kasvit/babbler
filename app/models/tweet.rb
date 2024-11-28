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
class Tweet < ApplicationRecord
  belongs_to :user

  validates :content, presence: true, length: { maximum: 280 }

  # after_create_commit -> { broadcast_prepend_later_to "tweets" }
  # after_update_commit -> { broadcast_replace_later_to "tweets" }
  # after_destroy_commit -> { broadcast_remove_to "tweets" }
  broadcasts_to ->(_tweet) { 'tweets' }, inserts_by: :prepend

  scope :ordered, -> { order(created_at: :desc) }
end
