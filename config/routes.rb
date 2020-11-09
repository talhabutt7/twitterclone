Rails.application.routes.draw do
  devise_for :users

  resources :tweeets
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "tweeets#mainpage"
  # root to: "tweeets#index"
  get "tweeets" => "tweeets#setupprofile"
end
