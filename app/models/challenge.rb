class Challenge < ApplicationRecord
  belongs_to :user
  has_many :tag_challenges

  validates_presence_of :title
  validates_presence_of :description

  def self.remove(user_id)
    challenges = Challenge.where(user_id: user_id)
    challenges.each do |challenge|
    TagChallenge.delete( TagChallenge.where(challenge_id: challenge.id).ids[0] )
    end
    if challenges.delete_all
      return(1)
    else
      return(0)
    end
  end
end
