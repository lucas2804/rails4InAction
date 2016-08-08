require 'rails_helper'

RSpec.describe "user_votes/show", type: :view do
  before(:each) do
    @user_vote = assign(:user_vote, UserVote.create!(
      :user_id => 1,
      :joke_id => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
  end
end
