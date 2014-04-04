require 'spec_helper'

describe PostsController do

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

    describe "GET 'index'" do
      it "returns http success" do
        get 'index'
        response.should be_success
      end
    end

    describe "GET 'new'" do
      it "returns http success" do
        get 'new'
        response.should be_success
      end
    end

    describe "GET 'create'" do
      it "returns http success" do
        get 'create'
        response.should be_success
      end
    end
  end
end
