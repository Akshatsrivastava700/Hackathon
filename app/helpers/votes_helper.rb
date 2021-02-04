module VotesHelper
  def count_vote(challenge_id)
    Vote.where(challenge_id: challenge_id).count
  end

  def check_vote(challenge_id, owner_id)
    if owner_id == current_user.id
      link_to image_tag('add_vote.png'), vote_path(:challenge_id => challenge_id, :user_id => owner_id ), :class => 'owner-like'
    elsif Vote.check(challenge_id, current_user.id) < 1
        link_to image_tag('add_vote.png'), vote_path(:challenge_id => challenge_id, :user_id => owner_id )
    else
       link_to image_tag('voted.png'), remove_vote_path(:challenge_id => challenge_id, :user_id => owner_id )
    end
  end
end
