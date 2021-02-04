require "rails_helper"
RSpec.describe HomeController, type: :controller do
  let(:user)  { FactoryBot.create(:user) }
  describe "GET /" do
    context "from login user" do
      it "should return 200:OK" do
        sign_in user
        get :index
        expect(response).to have_http_status(:success)
      end

      it "should return 302:OK" do
        get :index
        expect(response).to have_http_status(:found)
      end
    end
  end
end
