require 'rails_helper'

RSpec.describe "jokes/edit", type: :view do
  before(:each) do
    @joke = assign(:joke, Joke.create!(
      :name => "MyString",
      :content => "MyText"
    ))
  end

  it "renders the edit joke form" do
    render

    assert_select "form[action=?][method=?]", joke_path(@joke), "post" do

      assert_select "input#joke_name[name=?]", "joke[name]"

      assert_select "textarea#joke_content[name=?]", "joke[content]"
    end
  end
end
