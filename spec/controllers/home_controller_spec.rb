require 'rails_helper'

RSpec.describe HomeController, type: :controller do

  describe "GET #initialize" do
    it "returns http success" do
      get :initialize
      expect(response).to have_http_status(:success)
    end
  end

end
