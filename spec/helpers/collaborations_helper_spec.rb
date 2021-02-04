require 'rails_helper'

RSpec.describe CollaborationsHelper, type: :helper do

  context "from Check Collaborations" do
    let!(:user) { FactoryBot.create(:user) }
    let!(:challenge) { FactoryBot.create(:challenge) }
    let!(:collaboration) { FactoryBot.create(:collaboration, user: user, challenge: challenge) }
      it "displays faded icon for challenge owner" do
        expect( helper.check_collaboration(challenge.id, user.id, user.id) ).to have_selector(".owner-like")
        expect( helper.check_collaboration(challenge.id, user.id, user.id) ).to include(collaborate_url)
      end

      it "displays collaborated icon for challenge" do
        expect( helper.check_collaboration(challenge.id, challenge.user_id, user.id) ).to include(remove_collaboration_url)
      end
  end

  context "from Check Collaborations" do
    let!(:user) { FactoryBot.create(:user) }
    let!(:challenge) { FactoryBot.create(:challenge) }
    it "displays not collaborated icon for challenge" do
      expect( helper.check_collaboration(challenge.id, challenge.user_id, user.id) ).to include(collaborate_url)
    end
  end
end
