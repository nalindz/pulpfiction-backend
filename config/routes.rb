Bookapp::Application.routes.draw do
  resources :users

  resources :stories do
    resource :bookmarks, :only => [:create, :destroy]
    resource :story_views, :path => "view" , :only => [:create]
  end

  resources :blocks, :only => [:index]

  resource :login
  resource :logs, :only => [:create]
  
  match 'faq' => 'sites#faq', :as => :faq
  match 'contact' => 'sites#contact', :as => :contact
  root :to => 'sites#index'
end
