require 'spec_helper'

describe UsersController do
	context "logged in user" do
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

	  describe "get show aka profile page" do
	    it "returns http success" do
	      get 'profile'
	      response.should be_success
	    end
	  end

	end
end
