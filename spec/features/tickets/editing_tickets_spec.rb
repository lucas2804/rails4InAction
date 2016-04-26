require "rails_helper"

RSpec.describe "A sample test" do
  let(:user) { FactoryGirl.create(:user) }
  let!(:project) { FactoryGirl.create(:project) }
  let(:ticket) { FactoryGirl.create(:ticket, author: user) }
  it "lazily loads `let` methods" do
    assign_role!(user, :viewer, project)
    login_as(user)
    puts Project.count  # let! create project immediately
    puts Ticket.count   # Still not call from ticket instance => count = 0
    puts ticket.name    # Start to call from ticket instance
    puts Ticket.count   #   Count = 1
  end
  #let -> lazy loader, until call project
  #let! -> Call method immediatelyy
end


RSpec.feature "Users can edit existing tickets" do
  let(:user) { FactoryGirl.create(:user) }
  let(:project) { FactoryGirl.create(:project) }
  let(:ticket) { FactoryGirl.create(:ticket, project: project, author: user) }

  before do
    assign_role!(user, :viewer, project)
    login_as(user)

    visit project_ticket_path(project, ticket)
    click_link "Edit Ticket"
  end
  scenario "with valid attributes" do
    fill_in "Name", with: "Make it really shiny!"
    click_button "Update Ticket"
    expect(page).to have_content "Ticket has been updated."
    within("#ticket h2") do
      expect(page).to have_content "Make it really shiny!"
      expect(page).not_to have_content ticket.name
    end
  end
  scenario "with invalid attributes" do
    fill_in "Name", with: ""
    click_button "Update Ticket"
    expect(page).to have_content "Ticket has not been updated."
  end
end