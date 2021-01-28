class VoteCollaboration
  def initialize(model_name, challenge_id, user_id)
    @model_name   = model_name.constantize
    @challenge_id = challenge_id
    @user_id      = user_id
  end

  def add
    @model              = @model_name.new
    @model.challenge_id = @challenge_id.to_i
    @model.user_id      = @user_id.to_i
    if @model.save
      return(1)
    end
    return(0)
  end

  def delete
    @model = @model_name.where(challenge_id: @challenge_id, user_id: @user_id)
    if @model.delete(@model.ids[0].to_i) > 0
      return(1)
    end
    return(0)
  end
end
