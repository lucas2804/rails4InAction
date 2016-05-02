require 'rails_helper'

RSpec.describe "Admin::States", type: :request do
  describe "GET /admin_states" do
    it "works! (now write some real specs)" do
      get admin_states_path
      expect(response).to have_http_status(200)
    end
  end
end
