Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "tweeets#index"
  # put '/tweeet/:id/like', to: 'tweeets#like', as: 'like'
  resources :tweeets do
    resources :likes
  end
end
