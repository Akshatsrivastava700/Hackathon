require "rails_helper"
RSpec.describe HomeController, type: :controller do
  user = FactoryBot.create(:user)
  describe "GET /" do
    context "from login user" do

      it "should return 200:OK" do
        sign_in(user)
        get :index
        expect(response).to have_http_status(:success)
      end
    end
  end
end
