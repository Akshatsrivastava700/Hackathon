class Vote < ApplicationRecord
  belongs_to :challenge
  belongs_to :user

  validates_presence_of :challenge_id
  validates_presence_of :user_id

  scope :check, lambda { |challenge_id, current_user_id | where(challenge_id: challenge_id, user_id: current_user_id ).count }
end
