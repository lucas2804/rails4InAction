module CapybaraMatchers
  def has_heading?(text)
    has_css?("h1, h2, h3, h4, h5, h6", text: text)
  end

  def tag(content)
    find("div.tag", text: content)
  end
end

Capybara::Session.include(CapybaraMatchers)