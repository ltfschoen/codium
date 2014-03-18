require 'spec_helper'
include Warden::Test::Helpers
Warden.test_mode!

feature "project management" do

  context "when logged in" do

    let(:user) do
      user = User.new(email: 'test@test.com')
      user.username = 'epoch'
      user.password = user.password_confirmation = 'password'
      user.save
      user
    end

    before(:each) do
      login_as(user, :scope => :user)
    end

    scenario "create project" do
      visit new_project_path
      fill_in "Name", :with => "my first project"
      click_button "Create"

      expect(page).to have_text("Project was successfully created")
    end

    scenario "list all project" do
      Project.create(name: 'first app')
      Project.create(name: 'second app')

      visit projects_path

      expect(page).to have_text("first app")
      expect(page).to have_text("second app")
    end

  end

end  
