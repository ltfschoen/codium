require 'spec_helper'
include Warden::Test::Helpers
Warden.test_mode!

feature "account management" do

 # github login has been descoped
  # context "when logged in with github" do

  #   let(:user) do
  #     user = User.new(email: 'test@test.com')
  #     user.username = 'epoch'
  #     user.password = user.password_confirmation = 'password'
  #     user.uid = '12345'
  #     user.provider = 'github'
  #     user.save
  #     user
  #   end

  #   before(:each) do
  #     login_as(user, :scope => :user)
  #   end

  #   scenario "view profile page" do
  #     visit "/users/#{user.username}"
  #     expect(page).to have_text(user.username)
  #     expect(page).to have_link("Edit")
  #   end    

  # end

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

    scenario "user sign out" do
      visit destroy_user_session_path

      response.should redirect_to(root_url)
    end

    scenario "view profile page" do
      visit "/users/#{user.username}"
      expect(page).to have_text(user.username)
      expect(page).to have_link("edit")
    end

  end

  context "when logged out" do

    let(:user) do
      user = User.new(email: 'test@test.com')
      user.username = 'epoch'
      user.password = user.password_confirmation = 'password'
      user.save
      user
    end

    scenario "view profile page" do
      visit "/users/#{user.username}"
      expect(page).to have_text(user.username)
    end
  end

end  
