Rails.application.routes.draw do
  resources :cuestionarios
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "english", to: "pages#english"
end
