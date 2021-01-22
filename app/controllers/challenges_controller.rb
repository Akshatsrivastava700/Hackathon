class ChallengesController < ApplicationController
  def show
    #For displaying a challenge
  end

  def create
     params[:challenge][:user_id] = current_user.id.to_i
     @challenge = Challenge.new(set_params)
     
     if @challenge.save
       if TagChallenge.add_tag(params[:challenge][:tag_id], @challenge.id) == 1
         redirect_to root_path, notice: "Challenge Added"
       else
         redirect_to root_path, notice: "Challenge Added without tag"
       end
    else
       redirect_to root_path, alert: "Error: Challenge not saved"
     end
  end

  private
  def set_params
    params.require(:challenge).permit(:title, :description, :user_id)
  end
end
