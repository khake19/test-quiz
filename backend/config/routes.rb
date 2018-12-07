Rails.application.routes.draw do

  resources :questions do
    member do
      post :answer
    end
  end
  
end
