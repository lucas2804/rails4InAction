require 'rails_helper'

RSpec.describe "admin/states/show", type: :view do
  before(:each) do
    @admin_state = assign(:admin_state, Admin::State.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
