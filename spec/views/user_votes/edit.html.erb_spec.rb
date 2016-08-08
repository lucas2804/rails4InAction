require 'rails_helper'

RSpec.describe "user_votes/edit", type: :view do
  before(:each) do
    @user_vote = assign(:user_vote, UserVote.create!(
      :user_id => 1,
      :joke_id => 1
    ))
  end

  it "renders the edit user_vote form" do
    render

    assert_select "form[action=?][method=?]", user_vote_path(@user_vote), "post" do

      assert_select "input#user_vote_user_id[name=?]", "user_vote[user_id]"

      assert_select "input#user_vote_joke_id[name=?]", "user_vote[joke_id]"
    end
  end
end
