require 'rails_helper'

RSpec.describe CollaborationsHelper, type: :helper do
  let!(:user) { FactoryBot.create(:user) }
  let!(:challenge) { FactoryBot.create(:challenge, user: user) }
  let!(:collaboration) { FactoryBot.create(:collaboration, user: user, challenge: challenge) }
  context "from Find Collaborations" do
      it "returns Collaborators" do
        expect( helper.find_collaborations(challenge.id).count).to be > 0
      end
  end
end
