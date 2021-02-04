module CollaborationsHelper
  def find_collaborations(challenge_id)
    @collaborations.where(challenge_id: challenge_id)
  end

  def check_collaboration(challenge_id, owner_id )
    if owner_id === current_user.id
      link_to image_tag('contribute.png'), collaborate_url( :challenge_id => challenge_id, :user_id => current_user.id )
    else
      link_to image_tag('contributed.png'), remove_collaboration_url(:challenge_id => challenge_id, :user_id => current_user.id )
    end
  end
end
