class Tag < ApplicationRecord
  has_many :tag_chalenges

  scope :get_tag_name, -> (challenge_id) { select(:tag_name).where(id: TagChallenge.select(:tag_id).where(challenge_id: challenge_id)) } 
end
