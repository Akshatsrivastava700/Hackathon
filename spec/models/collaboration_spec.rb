require "rails_helper"
RSpec.describe Collaboration, type: :model do
  describe "Validations" do
    it { is_expected.to validate_presence_of(:challenge_id) }
    it { is_expected.to validate_presence_of(:user_id) }
  end

  describe "Associations" do
    it { should belong_to(:challenge) }
    it { should belong_to(:user) }
  end
end
