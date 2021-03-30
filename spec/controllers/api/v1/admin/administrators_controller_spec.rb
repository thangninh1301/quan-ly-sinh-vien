require 'rails_helper'

RSpec.describe Api::V1::Admin::AdministratorsController, type: :controller do
  let(:administrator) { create(:administrator) }
  let(:auth_headers) { administrator.create_new_auth_token }

  before do
    @request.env["devise.mapping"] = Devise.mappings[:api_v1_admin_administrator]
    @request.headers.merge!(auth_headers)
  end

  describe "PATCH /api/v1/admin/administrators/:id", autodoc: true do
    let(:administrator_params) {
      {
        email: "admin@example.com",
        name: "Admin"
      }
    }

    context "Authorization invalid" do
      let(:auth_headers) { { uid: "invalid" } }

      it "return error" do
        patch :update, params: {
          id: administrator.id,
          administrator: administrator_params }

        expect(response.status).to eq 401
        expect(json["errors"]).to_not be_nil
      end
    end

    context "Can update profile info" do
      it "Update profile success" do
        patch :update, params: { id: administrator.id,
          administrator: administrator_params }

        expect(response.status).to eq 200
        expect(json["success"]).to eq true
        expect(json["data"]["id"]).to eq administrator.id
        expect(json["data"]["name"]).to eq "Admin"
      end
    end

    context "Update password" do
      let(:administrator_params) do
        {
          password: "aaaa1234",
          password_confirmation: "aaaa1234"
        }
      end

      context "Valid password params" do
        it "response success" do
          patch :update, params: { id: administrator.id, administrator: administrator_params }

          expect(response.status).to eq 200
          expect(json["success"]).to eq true
        end
      end

      context "Invalid password params" do
        let(:administrator_params) do
          {
            password: "aaaa1234",
            password_confirmation: "invalid confirmation"
          }
        end

        it "response error" do
          patch :update, params: { id: administrator.id,
            administrator: administrator_params }

          expect(response.status).to eq 200
          expect(json["success"]).to eq false
          expect(json["errors"]).to_not be_nil
        end
      end
    end

    context "Invalid" do
      it "Error" do
        administrator_params.merge!(name: nil)
        patch :update, params: { id: administrator.id, administrator: administrator_params }

        expect(response.status).to eq 200
        expect(json["success"]).to eq false
        expect(json["errors"]).to_not be_nil
      end
    end
  end

  describe "GET /api/v1/admin/administrators/me", autodoc: true do
    context "Authorization invalid" do
      let(:auth_headers) { { uid: "invalid" } }

      it "return error" do
        get :me

        expect(response.status).to eq 401
        expect(json["errors"]).to_not be_nil
      end
    end

    context "signed in" do
      it "return administrator info" do
        get :me

        expect(response.status).to eq 200
        expect(json["data"]["id"]).to eq administrator.id
      end
    end
  end
end
