class Collaboration < ApplicationRecord
  belongs_to :challenge
  belongs_to :user

  def self.check(challenge_id, user_id)
    if Collaboration.where(challenge_id: challenge_id, user_id: user_id).count != 0
      return(1)
    end
    return(0)
  end

  def self.delete_collaboration(challenge_id, user_id)
    @collaborate = Collaboration.where(challenge_id: challenge_id, user_id: user_id)
    if @collaborate.delete(@collaborate.ids[0].to_i)
      return(1)
    end
    return(0)
  end

  def self.add_collaboration(challenge_id, user_id)
    @collaborate              = Collaboration.new
    @collaborate.challenge_id = challenge_id.to_i
    @collaborate.user_id      = user_id.to_i
    if @collaborate.save
      return(1)
    end
    return(0)
  end
end
