require 'spec_helper'
include Warden::Test::Helpers
Warden.test_mode!

feature "page management" do

  context "when logged in" do

    let(:user) do
      user = User.new(email: 'test@test.com')
      user.password = user.password_confirmation = 'password'
      user.username = 'epoch'
      user.save
      user
    end

    before(:each) do
      login_as(user, :scope => :user)
    end

    scenario "create new post" do
      visit new_post_path
      fill_in "Title", :with => "my first post"
      click_button "Publish"

      expect(page).to have_text("Post was successfully published")
    end

    scenario "edit draft post" do
      post = Post.create(title: 'test post', published: false, user: user)
      visit edit_post_path(post)
      expect(find_field('Title').value).to have_text('test post')
      expect(page).to have_button('Publish')
    end

    scenario "view draft post list" do
      post = Post.create(title: 'awesome story', user: user, published: false)
      post = Post.create(title: 'history now', user: user, published: true)
      visit '/me/drafts'
      expect(page).to have_text('Drafts')
      expect(page).to have_text('awesome story')
      expect(page).to have_no_text('history now')
    end

  end

  context "when logged out" do

    scenario "view post" do
      post = Post.create(title: "first post")

      visit root_path
      expect(page).to have_text('first post')
    end

  end
end  
