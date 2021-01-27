module ChallengesHelper
  def challenge_date_beautify(time)
    t = time.to_s.split(" ")
    return(t[0])
  end
end
