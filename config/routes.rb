Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      namespace :admin do
        resources :administrators, only: [:update] do
          collection do
            get :me
          end
        end
        mount_devise_token_auth_for "Administrator", at: "", controllers: {
          sessions: "api/v1/admin/sessions",
          passwords: "api/v1/admin/passwords"
        }
      end
    end
  end
  devise_for :users, path: 'auth', skip: [:registrations]
end
