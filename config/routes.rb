Bookapp::Application.routes.draw do
  resources :stories do
    resources :blocks
    resource :tags
  end

  resource :history
end
