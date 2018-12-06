Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :questions do
        member do
          post :answer
        end
      end
    end
  end

end
