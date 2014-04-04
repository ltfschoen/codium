require 'spec_helper'


describe MembershipsController do

let(:valid_attributes) { { member_id: "1", project_id: "1"  } }
let(:unvalid_attributes) { { member_id: nil, project_id: "1" } }

context "when no logged in " do 
  it "not allow me to create new membership" do
    expect {
      post :create, { membership: valid_attributes, :format => 'js' }
    }.not_to change(Membership, :count).by(1)
  end

  it "redirect me to login page" do
    post :create, { membership: valid_attributes, :format => 'js' }
    expect(response.status).to eq(401)
  end

end


context "logged in" do
before(:each) do
  user = User.create(email:"test@test.com", password:"password", password_confirmation:"password", username: "test")
  sign_in user
end

  context "POST 'create'" do
    context "with valid params" do
      it "create a new membership" do
        # @membership = Membership.new(valid_attributes)
        # @membership.save
        # expect(@membership.errors).to eq([])

        # post :create, {:membership => valid_attributes, :format => 'js'}
        # response.should redirect_to("/")

        expect {
        post :create, { membership: valid_attributes, :format => 'js' }
        }.to change(Membership, :count).by(1)
      end
      it "assigns a newly created membership as @membership" do
        post :create, {:membership => valid_attributes, :format => 'js' }
        assigns(:membership).should be_a(Membership)
        assigns(:membership).should be_persisted
      end
    end
    context "with unvalid params" do
      it "assigns a newly created but unsaved membership as @membership" do
        # Trigger the behavior that occurs when invalid params are submitted
        Membership.any_instance.stub(:save).and_return(false)
        post :create, {:membership => unvalid_attributes, :format => 'js' }
        assigns(:membership).should be_a_new(Membership)
      end
    end
  end

  context "POST 'destroy'" do
    it "destroys the requested membership" do
      membership = Membership.create! valid_attributes
      expect {
        delete :destroy, {:id => membership.to_param, :format => 'js' }
      }.to change(Membership, :count).by(-1)
    end
  end
end

end