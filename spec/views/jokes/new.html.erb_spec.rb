require 'rails_helper'

RSpec.describe "jokes/new", type: :view do
  before(:each) do
    assign(:joke, Joke.new(
      :name => "MyString",
      :content => "MyText"
    ))
  end

  it "renders new joke form" do
    render

    assert_select "form[action=?][method=?]", jokes_path, "post" do

      assert_select "input#joke_name[name=?]", "joke[name]"

      assert_select "textarea#joke_content[name=?]", "joke[content]"
    end
  end
end
