require 'rails_helper'

RSpec.describe "user_votes/new", type: :view do
  before(:each) do
    assign(:user_vote, UserVote.new(
      :user_id => 1,
      :joke_id => 1
    ))
  end

  it "renders new user_vote form" do
    render

    assert_select "form[action=?][method=?]", user_votes_path, "post" do

      assert_select "input#user_vote_user_id[name=?]", "user_vote[user_id]"

      assert_select "input#user_vote_joke_id[name=?]", "user_vote[joke_id]"
    end
  end
end
