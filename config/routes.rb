Bookapp::Application.routes.draw do
  resources :users

  resources :stories do
    resources :blocks, :only => [:index]
    resource :bookmarks, :only => [:create, :destroy]
    resource :story_views, :path => "view" , :only => [:create]
  end

end
