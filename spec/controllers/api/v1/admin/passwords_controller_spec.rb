require 'rails_helper'

RSpec.describe Api::V1::Admin::PasswordsController, type: :controller do
  let(:administrator) { create(:administrator) }

  describe "POST /api/v1/admin/password", autodoc: true do
    describe "POST /api/v1/admin/password success" do
      it "request should succeed" do
        @request.env["devise.mapping"] = Devise.mappings[:api_v1_admin_administrator]
        post :create, params: {
          email: administrator.email,
          redirect_url: "http://host.com/home"
        }

        expect(response.status).to eq 200
        expect(json["success"]).to eq true
        expect(json["message"]).to_not be_nil
      end
    end

    describe "POST /api/v1/admin/password failed" do
      it "request should failed" do
        @request.env["devise.mapping"] = Devise.mappings[:api_v1_admin_administrator]
        post :create, params: {
          email: "test@gmail",
          redirect_url: "http://host.com/home"
        }

        expect(response.status).to eq 404
        expect(json["success"]).to eq false
        expect(json["errors"]).to_not be_nil
      end
    end
  end

  describe "GET /api/v1/admin/password/edit", autodoc: true do
    let(:redirect_url) { "http://host.com/home" }
    let(:reset_password_token) { prepare_password_reset_token(administrator, redirect_url) }

    describe "GET /api/v1/admin/password/edit success" do
      it "request should succeed" do
        @request.env["devise.mapping"] = Devise.mappings[:api_v1_admin_administrator]
        get :edit, params: {
          reset_password_token: reset_password_token,
          redirect_url: redirect_url
        }
        expect(response.status).to eq(200)
        expect(json["success"]).to eq true
        expect(json["data"]["reset_password_token"]).to eq reset_password_token
      end
    end

    describe "GET /api/v1/admin/password/edit failed" do
      it "request should failed" do
        @request.env["devise.mapping"] = Devise.mappings[:api_v1_admin_administrator]
        get :edit, params: {
          reset_password_token: "test",
          redirect_url: "http://host.com/home"
        }
        expect(response.status).to eq 200
        expect(json["success"]).to eq false
        expect(json["errors"]).to eq [I18n.t("errors.exception.token_invalid")]
      end
    end
  end

  describe "PATCH /api/v1/admin/password", autodoc: true do
    let(:redirect_url) { "http://host.com/home" }
    let(:reset_password_token) { prepare_password_reset_token(administrator, redirect_url) }

    describe "PATCH /api/v1/admin/password success" do
      it "request should succeed" do
        @request.env["devise.mapping"] = Devise.mappings[:api_v1_admin_administrator]
        patch :update, params: {
          reset_password_token: reset_password_token,
          password: "aaaa1234",
          password_confirmation: "aaaa1234"
        }
        expect(response.status).to eq 200
        expect(json["success"]).to eq true
        expect(json["message"]).to_not be_nil
      end
    end

    describe "PATCH /api/v1/admin/password failed" do
      it "reset password token failed" do
        @request.env["devise.mapping"] = Devise.mappings[:api_v1_admin_administrator]
        patch :update, params: {
          reset_password_token: "test",
          password: "aaaa1234",
          password_confirmation: "aaaa1234"
        }
        expect(response.status).to eq 401
        expect(json["success"]).to eq false
        expect(json["errors"]).to_not be_nil
      end
    end

    describe "PATCH /api/v1/admin/password failed" do
      it "password validation failed" do
        @request.env["devise.mapping"] = Devise.mappings[:api_v1_admin_administrator]
        patch :update, params: {
          reset_password_token: reset_password_token,
          password: "aaaa12",
          password_confirmation: "aaaa1234"
        }

        expect(response.status).to eq 422
        expect(json["success"]).to eq false
        expect(json["errors"]).to_not be_nil
      end
    end
  end
end