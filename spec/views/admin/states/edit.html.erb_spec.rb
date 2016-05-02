require 'rails_helper'

RSpec.describe "admin/states/edit", type: :view do
  before(:each) do
    @admin_state = assign(:admin_state, Admin::State.create!())
  end

  it "renders the edit admin_state form" do
    render

    assert_select "form[action=?][method=?]", admin_state_path(@admin_state), "post" do
    end
  end
end
