Bookapp::Application.routes.draw do
  resources :users

  resources :stories do
    resources :blocks
    resource :bookmarks
    resource :tags
  end

  resource :bookmarks
end
