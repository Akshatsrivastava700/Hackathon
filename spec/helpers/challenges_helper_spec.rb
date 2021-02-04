require 'rails_helper'

RSpec.describe ChallengesHelper, type: :helper do
  context "from Challenge Date Beautify" do
      it "returns Date" do
        expect( helper.challenge_date_beautify("03-02-2021 23:20:00")).to eq("03-02-2021")
      end
  end

end
