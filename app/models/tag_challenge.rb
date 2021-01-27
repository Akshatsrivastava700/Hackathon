class TagChallenge < ApplicationRecord
  belongs_to :tag
  belongs_to :challenge

  validates_presence_of :tag_id
  validates_presence_of :challenge_id

  def self.add_tag(tag_id, challenge_id)
    @tag_challenge = TagChallenge.new
    @tag_challenge.challenge_id = challenge_id.to_i
    @tag_challenge.tag_id       = tag_id.to_i
    if @tag_challenge.save
      return(1)
    else
      return(0)
    end
  end
end
