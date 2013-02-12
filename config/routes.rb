Bookapp::Application.routes.draw do
  resources :users

  resources :stories do
    resources :blocks
    resource :tags
  end

  resources :bookmarks
end
