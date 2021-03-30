require 'rails_helper'

RSpec.describe Api::V1::Admin::SessionsController, type: :controller do
  let(:administrator) { create(:administrator) }

  describe "POST /api/v1/admin/sign_in", autodoc: true do
    describe "confirmed administrator" do
      describe "POST /api/v1/admin/sign_in success" do
        it "request should succeed" do
          @request.env["devise.mapping"] = Devise.mappings[:api_v1_admin_administrator]

          post :create, params: {
            email: administrator.email,
            password: administrator.password
          }

          expect(response.status).to eq 200
          expect(json["success"]).to eq true
          expect(json["data"]["email"]).to eq administrator.email
        end
      end

      describe "POST /api/v1/admin/sign_in failed" do
        it "request should failed" do
          @request.env["devise.mapping"] = Devise.mappings[:api_v1_admin_administrator]

          post :create, params: {
            email: administrator.email,
            password: "bug"
          }

          expect(response.status).to eq 401
          expect(json["success"]).to eq false
          expect(json["errors"]).to_not be_nil
        end
      end
    end

    describe "none-existing", autodoc: false do
      describe "POST /api/v1/admin/sign_in failed" do
        it "request should failed" do
          @request.env["devise.mapping"] = Devise.mappings[:api_v1_admin_administrator]

          post :create, params: {
            email: "none-existing@gmail.com",
            password: "test123"
          }

          expect(response.status).to eq 401
          expect(json["success"]).to eq false
          expect(json["errors"]).to_not be_nil
        end
      end
    end
  end

  describe "POST /api/v1/admin/sign_out", autodoc: true do
    let(:auth_headers) { administrator.create_new_auth_token }

    it "sign out success" do
      @request.env["devise.mapping"] = Devise.mappings[:api_v1_admin_administrator]
      @request.headers.merge!(auth_headers)
      delete :destroy

      expect(response.status).to eq 200
      expect(administrator.reload.tokens[auth_headers['client']]).to eq nil
    end

    it "sign out failed" do
      @request.env["devise.mapping"] = Devise.mappings[:api_v1_admin_administrator]
      delete :destroy

      expect(response.status).to eq 404
      expect(json["errors"]).to_not be_nil
    end
  end
end