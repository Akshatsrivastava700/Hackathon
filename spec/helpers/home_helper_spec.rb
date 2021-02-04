require 'rails_helper'

RSpec.describe HomeHelper, type: :helper do
  let!(:tag)  { FactoryBot.create(:tag) }
  let!(:challenge) { FactoryBot.create(:challenge) }
  let!(:tag_challenge) { FactoryBot.create(:tag_challenge, tag: tag, challenge: challenge) }
  context "from Find Tag" do
      it "returns Tag Name" do
        expect( helper.find_tag(challenge.id)).to eq("analysis")
      end
  end

  context "from Find User Firstname" do
      it "returns First Name" do
         expect( helper.find_user_firstname(challenge.user_id) ).to eq('a')
      end
  end
end
