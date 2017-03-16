require 'rails_helper'
RSpec.describe IssuesController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Issue. As you add validations to Issue, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) do
    {
      name: "broken cable",
      description: "the cable is broked"
    }
  end

  let(:invalid_attributes) do
    {
      name: nil,
    }
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # IssuesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all issues as @issues" do
      issue = Issue.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(assigns(:issues)).to eq([issue])
    end
  end

  describe "GET #show" do
    it "assigns the requested issue as @issue" do
      issue = Issue.create! valid_attributes
      get :show, params: {id: issue.to_param}, session: valid_session
      expect(assigns(:issue)).to eq(issue)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Issue" do
        expect {
          post :create, params: {issue: valid_attributes}, session: valid_session
        }.to change(Issue, :count).by(1)
      end

      it "assigns a newly created issue as @issue" do
        post :create, params: {issue: valid_attributes}, session: valid_session
        expect(assigns(:issue)).to be_a(Issue)
        expect(assigns(:issue)).to be_persisted
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved issue as @issue" do
        post :create, params: {issue: invalid_attributes}, session: valid_session
        expect(assigns(:issue)).to be_a_new(Issue)
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) do
        {name: "bob"}
      end

      it "updates the requested issue" do
        issue = Issue.create! valid_attributes
        put :update, params: {id: issue.to_param, issue: new_attributes}, session: valid_session
        issue.reload
        expect(assigns(:issue).name).to eq new_attributes[:name]
      end

      it "assigns the requested issue as @issue" do
        issue = Issue.create! valid_attributes
        put :update, params: {id: issue.to_param, issue: valid_attributes}, session: valid_session
        expect(assigns(:issue)).to eq(issue)
      end
    end

    context "with invalid params" do
      it "assigns the issue as @issue" do
        issue = Issue.create! valid_attributes
        put :update, params: {id: issue.to_param, issue: invalid_attributes}, session: valid_session
        expect(assigns(:issue)).to eq(issue)
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested issue" do
      issue = Issue.create! valid_attributes
      expect {
        delete :destroy, params: {id: issue.to_param}, session: valid_session
      }.to change(Issue, :count).by(-1)
    end
  end

end
