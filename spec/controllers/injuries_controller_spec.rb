require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

RSpec.describe InjuriesController, :type => :controller do

  # This should return the minimal set of attributes required to create a valid
  # Injury. As you add validations to Injury, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # InjuriesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all injuries as @injuries" do
      injury = Injury.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:injuries)).to eq([injury])
    end
  end

  describe "GET show" do
    it "assigns the requested injury as @injury" do
      injury = Injury.create! valid_attributes
      get :show, {:id => injury.to_param}, valid_session
      expect(assigns(:injury)).to eq(injury)
    end
  end

  describe "GET new" do
    it "assigns a new injury as @injury" do
      get :new, {}, valid_session
      expect(assigns(:injury)).to be_a_new(Injury)
    end
  end

  describe "GET edit" do
    it "assigns the requested injury as @injury" do
      injury = Injury.create! valid_attributes
      get :edit, {:id => injury.to_param}, valid_session
      expect(assigns(:injury)).to eq(injury)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Injury" do
        expect {
          post :create, {:injury => valid_attributes}, valid_session
        }.to change(Injury, :count).by(1)
      end

      it "assigns a newly created injury as @injury" do
        post :create, {:injury => valid_attributes}, valid_session
        expect(assigns(:injury)).to be_a(Injury)
        expect(assigns(:injury)).to be_persisted
      end

      it "redirects to the created injury" do
        post :create, {:injury => valid_attributes}, valid_session
        expect(response).to redirect_to(Injury.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved injury as @injury" do
        post :create, {:injury => invalid_attributes}, valid_session
        expect(assigns(:injury)).to be_a_new(Injury)
      end

      it "re-renders the 'new' template" do
        post :create, {:injury => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested injury" do
        injury = Injury.create! valid_attributes
        put :update, {:id => injury.to_param, :injury => new_attributes}, valid_session
        injury.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested injury as @injury" do
        injury = Injury.create! valid_attributes
        put :update, {:id => injury.to_param, :injury => valid_attributes}, valid_session
        expect(assigns(:injury)).to eq(injury)
      end

      it "redirects to the injury" do
        injury = Injury.create! valid_attributes
        put :update, {:id => injury.to_param, :injury => valid_attributes}, valid_session
        expect(response).to redirect_to(injury)
      end
    end

    describe "with invalid params" do
      it "assigns the injury as @injury" do
        injury = Injury.create! valid_attributes
        put :update, {:id => injury.to_param, :injury => invalid_attributes}, valid_session
        expect(assigns(:injury)).to eq(injury)
      end

      it "re-renders the 'edit' template" do
        injury = Injury.create! valid_attributes
        put :update, {:id => injury.to_param, :injury => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested injury" do
      injury = Injury.create! valid_attributes
      expect {
        delete :destroy, {:id => injury.to_param}, valid_session
      }.to change(Injury, :count).by(-1)
    end

    it "redirects to the injuries list" do
      injury = Injury.create! valid_attributes
      delete :destroy, {:id => injury.to_param}, valid_session
      expect(response).to redirect_to(injuries_url)
    end
  end

end