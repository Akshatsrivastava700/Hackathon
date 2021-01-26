module HomeHelper
  def find_tag(challenge_id)
    Tag.get_tag_name(challenge_id).as_json[0]["tag_name"]
  end

  def get_tag
    Tag.all
  end

  def find_user_firstname(user_id)
    User.select(:firstname).find(user_id).firstname
  end
end
