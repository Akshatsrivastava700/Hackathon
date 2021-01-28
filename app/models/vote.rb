class Vote < ApplicationRecord
  belongs_to :challenge
  belongs_to :user

  validates_presence_of :challenge_id
  validates_presence_of :user_id
  
  def self.check(challenge_id, user_id)
    if Vote.where(challenge_id: challenge_id, user_id: user_id).count != 0
      return(1)
    end
    return(0)
  end


  #Used only while deleting an user account
  def self.remove(user_id)
    if Vote.where(user_id: user_id).delete_all
      return(1)
    else
      return(0)
    end
  end
end
