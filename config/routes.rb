Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :technologies
    end
  end
  namespace :api do
    namespace :v1 do
        end
  end
  use_doorkeeper do
    # No need to register client application
    skip_controllers :applications, :authorized_applications
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  scope module: :api, defaults: { format: :json } do
    scope module: :v1 do 
      resources :technologies
    end
  end

end
