require "rails_helper"
RSpec.describe ChallengesController, type: :controller do
  let(:user)  { FactoryBot.create(:user) }
  let(:tag)  { FactoryBot.create(:tag) }
  let(:challenge) { FactoryBot.create(:challenge) }
  let(:challenge) do
    {
      title: 'test',
      description: "test desc",
      user_id: user.id,
      tag_id: tag.id
    }
  end
  describe "GET /create" do
    context "from challenge create" do
      it "should return 302:OK and flash notice Challenge Added " do
        sign_in user
        get :create, params: { :challenge => challenge }
        expect(response).to redirect_to root_path
        expect(flash[:notice]).to eq("Challenge Added")
      end

      it "should return 302:OK and flash notice Challenge Added without tag" do
        sign_in user
        challenge[:tag_id] = nil
        get :create, params: { :challenge => challenge }
        expect(response).to redirect_to root_path
        expect(flash[:notice]).to eq("Challenge Added without tag")
      end

      it "should return 302:OK and flash alert Error: Challenge not saved " do
        sign_in user
        challenge[:title] = nil
        get :create, params: { :challenge => challenge }
        expect(response).to redirect_to root_path
        expect(flash[:alert]).to eq("Error: Challenge not saved")
      end
    end
  end
end
