require 'rails_helper'

RSpec.describe ApplicationController, type: :controller do
  describe "handle exceptions" do
    context "handling StandardError exceptions" do
      controller do
        def index
          raise StandardError
        end
      end
      it "response error" do
        get :index
        expect(response.status).to eq 500
        expect(json["success"]).to eq false
        expect(json["errors"]).to eq [I18n.t("errors.exception.standard_error")]
      end
    end

    context "handling RecordNotFound exceptions" do
      controller do
        def index
          raise ActiveRecord::RecordNotFound
        end
      end
      it "response error" do
        get :index
        expect(response.status).to eq 404
        expect(json["success"]).to eq false
        expect(json["errors"]).to eq [I18n.t("errors.exception.record_not_found")]
      end
    end

    context "handling InvalidAuthenticityToken exceptions" do
      controller do
        def index
          raise ActionController::InvalidAuthenticityToken
        end
      end
      it "response error" do
        get :index
        expect(response.status).to eq 400
        expect(json["success"]).to eq false
        expect(json["errors"]).to eq [I18n.t("errors.exception.invalid_authenticity_token")]
      end
    end

    context "handling RoutingError exceptions" do
      controller do
        def index
          raise ActionController::RoutingError.new("RoutingError")
        end
      end
      it "response error" do
        get :index

        expect(response.status).to eq 404
        expect(json["success"]).to eq false
        expect(json["errors"]).to eq [I18n.t("errors.exception.routing_error")]
      end
    end

    context "handling CanCan::AccessDenied exceptions" do
      controller do
        def index
          raise CanCan::AccessDenied.new("AccessDenied")
        end
      end
      it "response error" do
        get :index

        expect(response.status).to eq 401
        expect(json["success"]).to eq false
        expect(json["errors"]).to eq [I18n.t("errors.exception.access_denied")]
      end
    end
  end
end
