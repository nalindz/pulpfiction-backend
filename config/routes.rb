Bookapp::Application.routes.draw do
  resources :users

  resources :stories do
    resources :blocks
    resource :tags
  end

  resource :history
end
