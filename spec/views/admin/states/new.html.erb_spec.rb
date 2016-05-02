require 'rails_helper'

RSpec.describe "admin/states/new", type: :view do
  before(:each) do
    assign(:admin_state, Admin::State.new())
  end

  it "renders new admin_state form" do
    render

    assert_select "form[action=?][method=?]", admin_states_path, "post" do
    end
  end
end
