class Collaboration < ApplicationRecord
  belongs_to :challenge
  belongs_to :user

  validates_presence_of :user_id
  validates_presence_of :challenge_id
end
