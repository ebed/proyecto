require 'rails_helper'

RSpec.describe "Tipobanners", type: :request do
  describe "GET /tipobanners" do
    it "works! (now write some real specs)" do
      get tipobanners_path
      expect(response).to have_http_status(200)
    end
  end
end
