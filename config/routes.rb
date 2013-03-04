Bookapp::Application.routes.draw do
  resources :users

  resources :stories do
    resource :bookmarks, :only => [:create, :destroy]
    resource :story_views, :path => "view" , :only => [:create]
  end

  resources :blocks, :only => [:index]

  resource :login
end
