require 'rails_helper'

RSpec.describe VotesHelper, type: :helper do

  context "from Check Votes" do
    let!(:user) { FactoryBot.create(:user) }
    let!(:challenge) { FactoryBot.create(:challenge) }
    let!(:vote) { FactoryBot.create(:vote, user: user, challenge: challenge) }
      it "displays faded vote icon for challenge owner" do
        expect( helper.check_collaboration(challenge.id, user.id, user.id) ).to have_selector(".owner-like")
        expect( helper.check_vote(challenge.id, user.id, user.id) ).to include(vote_path)
      end

      it "displays voted icon for challenge" do
        expect( helper.check_vote(challenge.id, challenge.user_id, user.id) ).to include(remove_vote_path)
      end
  end

  context "from Check Votes" do
    let!(:user) { FactoryBot.create(:user) }
    let!(:challenge) { FactoryBot.create(:challenge) }
    it "displays not voted icon for challenge" do
      expect( helper.check_vote(challenge.id, challenge.user_id, user.id) ).to include(vote_path)
    end
  end

  context "from Count Vote" do
    let!(:user) { FactoryBot.create(:user) }
    let!(:challenge) { FactoryBot.create(:challenge) }
    let!(:vote) { FactoryBot.create(:vote, user: user, challenge: challenge) }
      it "return Vote Count for a challenge" do
        expect( helper.count_vote(challenge.id )).to be >= 0
      end
  end

end
