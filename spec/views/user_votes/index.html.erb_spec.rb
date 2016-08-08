require 'rails_helper'

RSpec.describe "user_votes/index", type: :view do
  before(:each) do
    assign(:user_votes, [
      UserVote.create!(
        :user_id => 1,
        :joke_id => 2
      ),
      UserVote.create!(
        :user_id => 1,
        :joke_id => 2
      )
    ])
  end

  it "renders a list of user_votes" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
