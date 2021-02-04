module CollaborationsHelper

  def check_collaboration(challenge_id, owner_id, current_user_id )
    if owner_id == current_user_id
      link_to image_tag('contribute.png'), collaborate_url(:challenge_id => challenge_id, :user_id => owner_id ), :class => 'owner-like'
    elsif Collaboration.check(challenge_id, current_user_id) < 1
      link_to image_tag('contribute.png'), collaborate_url( :challenge_id => challenge_id, :user_id => owner_id )
    else
      link_to image_tag('contributed.png'), remove_collaboration_url(:challenge_id => challenge_id, :user_id => owner_id )
    end
  end
end
