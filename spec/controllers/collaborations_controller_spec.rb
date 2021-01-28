require "rails_helper"
RSpec.describe CollaborationsController, type: :controller do
  let(:user)  { FactoryBot.create(:user) }
  let(:challenge) { FactoryBot.create(:challenge) }
  describe "GET /create" do
    it "should return 302:OK and flash notice Collaboration Added! " do
        sign_in user
        get :create, params: { :challenge_id => challenge.id }
        expect(response).to redirect_to root_path
        expect(flash[:notice]).to eq("Collaboration Added!")
    end
  end

  describe "GET /destroy" do
    it "should return 302:OK and flash notice Collaboration Removed! " do
        sign_in user
        get :create, params: { :challenge_id => challenge.id }
        get :destroy, params: { :challenge_id => challenge.id }
        expect(response).to redirect_to root_path
        expect(flash[:notice]).to eq("Collaboration Removed!")
    end
  end
end
