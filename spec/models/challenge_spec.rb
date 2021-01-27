require "rails_helper"
RSpec.describe Challenge, type: :model do
  describe "Validations" do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_presence_of(:user_id) }
  end

  describe "Associations" do
    it { should belong_to(:user) }
    it { should have_many(:tag_challenges) }
  end
end
