require "rails_helper"
RSpec.describe VotesController, type: :controller do
  let(:user)  { FactoryBot.create(:user) }
  let(:challenge) { FactoryBot.create(:challenge) }

  describe "GET /create" do
    it "should return 302:OK and flash notice Vote Added! " do
        sign_in user
        get :create, params: { :challenge_id => challenge.id, :user_id => challenge.user_id }
        expect(response).to redirect_to root_path
        expect(flash[:notice]).to eq("Vote Added!")
    end

    it "should return 302:OK and flash alert Error: Collaboration not Added " do
        sign_in user
        get :create, params: { :challenge_id => nil, :user_id => challenge.user_id }
        expect(response).to redirect_to root_path
        expect(flash[:alert]).to eq("Error: Vote not added!")
    end

    it "should return 302:OK and flash alert Error: Owner can't collaborate " do
        sign_in user
        get :create, params: { :challenge_id => challenge, :user_id => user.id }
        expect(response).to redirect_to root_path
        expect(flash[:alert]).to eq("Error: Owner can't vote")
    end
  end

  describe "GET /destroy" do
    it "should return 302:OK and flash notice Vote Removed! " do
        sign_in user
        get :create, params: { :challenge_id => challenge.id }
        get :destroy, params: { :challenge_id => challenge.id }
        expect(response).to redirect_to root_path
        expect(flash[:notice]).to eq("Vote Removed!")
    end
    
    it "should return 302:OK and flash alert Error: Collaboration not removed! " do
        sign_in user
        get :create, params: { :challenge_id => challenge.id }
        get :destroy, params: { :challenge_id => nil }
        expect(response).to redirect_to root_path
        expect(flash[:alert]).to eq("Error: Vote not removed!")
    end
  end
end
