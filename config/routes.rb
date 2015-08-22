Rails.application.routes.draw do

  resources :templates do
    collection { post :import }
  end
  
  root 'templates#index'

end
