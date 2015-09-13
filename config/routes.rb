Rails.application.routes.draw do
  match 'templates/import' => 'templates#import', via: [:get, :post]
  resources :templates do
    collection { post :import }
  end

  post 'templates/new' => 'templates#new'

  root 'templates#index'

end
