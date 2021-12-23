Rails.application.routes.draw do
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    root 'main#view'
    get 'session/login'
    post 'session/create'
    get 'session/logout'
    get '/show', to: 'main#show'
    resources :posts
    resources :users
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
