module VotesHelper
  def count_vote(challenge_id)
    Vote.where(challenge_id: challenge_id,user_id: current_user.id).count
  end

  def check_vote(challenge_id)
     if Vote.check(challenge_id, current_user.id) == 0
        link_to image_tag('add_vote.png'), vote_path(:challenge_id => challenge_id)
    else
       link_to image_tag('voted.png'), remove_vote_path(:challenge_id => challenge_id)
    end
  end
end
