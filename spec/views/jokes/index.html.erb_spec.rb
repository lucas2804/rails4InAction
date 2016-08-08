require 'rails_helper'

RSpec.describe "jokes/index", type: :view do
  before(:each) do
    assign(:jokes, [
      Joke.create!(
        :name => "Name",
        :content => "MyText"
      ),
      Joke.create!(
        :name => "Name",
        :content => "MyText"
      )
    ])
  end

  it "renders a list of jokes" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
