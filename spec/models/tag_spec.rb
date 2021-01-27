require "rails_helper"
RSpec.describe Tag, type: :model do
  describe "Validations" do
    it { is_expected.to validate_presence_of(:tag_name) }
  end

  describe "Associations" do
    it { should have_many(:tag_challenges) }
  end
end
