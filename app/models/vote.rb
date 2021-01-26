class Vote < ApplicationRecord
  belongs_to :challenge
  belongs_to :user

  def self.check(challenge_id, user_id)
    if Vote.where(challenge_id: challenge_id, user_id: user_id).count != 0
      return(1)
    end
    return(0)
  end

  def self.delete_vote(challenge_id, user_id)
    @vote = Vote.where(challenge_id: challenge_id, user_id: user_id)
    if @vote.delete(@vote.ids[0].to_i)
      return(1)
    end
    return(0)
  end

  def self.add_vote(challenge_id, user_id)
    @vote              = Vote.new
    @vote.challenge_id = challenge_id.to_i
    @vote.user_id      = user_id.to_i
    if @vote.save
      return(1)
    end
    return(0)
  end

  def self.remove(user_id)
    if Vote.where(user_id: user_id).delete_all
      return(1)
    else
      return(0)
    end
  end
end
