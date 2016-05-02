require 'rails_helper'

RSpec.describe "admin/states/index", type: :view do
  before(:each) do
    assign(:admin_states, [
      Admin::State.create!(),
      Admin::State.create!()
    ])
  end

  it "renders a list of admin/states" do
    render
  end
end
