module CollaborationsHelper
  def find_collaborations(challenge_id)
    @collaborations.where(challenge_id: challenge_id)
  end

  def check_collaboration(challenge_id, user_id )
    if Collaboration.check(challenge_id, current_user.id) == 0
      link_to image_tag('contribute.png'), collaborate_url( :challenge_id => challenge_id, :user_id => user_id)
    else
      link_to image_tag('contributed.png'), remove_collaboration_url(:challenge_id => challenge_id, :user_id => user_id)
    end
  end
end
