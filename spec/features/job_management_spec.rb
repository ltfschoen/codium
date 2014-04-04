require 'spec_helper'
include Warden::Test::Helpers
Warden.test_mode!

# -------- job creation has been descoped --------------
# -------- use job feeds from indeed instead ------------

# feature "jobs management" do

#   context "when logged in" do

#     let(:user) do
#       user = User.new(email: 'test@test.com')
#       user.username = 'epoch'
#       user.password = user.password_confirmation = 'password'
#       user.save
#       user
#     end

#     before(:each) do
#       login_as(user, :scope => :user)
#     end

#     scenario "create job" do
#       visit new_user_job_path(user)
#       fill_in "Name", :with => "ruby dev"
#       click_button "Create a Job"

#       expect(page).to have_text("Successfully created Job")
#     end

#     scenario "list all project" do
#       Job.create(name: 'ruby dev')
#       Job.create(name: 'rails dev')

#       visit jobs_path

#       expect(page).to have_text("ruby dev")
#       expect(page).to have_text("rails dev")
#       expect(page).to have_link("Add a Job")
#     end
#   end

#   context "when logged out" do

#     scenario "list all jobs" do
#       Job.create(name: 'ruby dev')
#       Job.create(name: 'rails dev')

#       visit jobs_path

#       expect(page).to have_text("ruby dev")
#       expect(page).to have_text("rails dev")
#     end

#   end

# end  
