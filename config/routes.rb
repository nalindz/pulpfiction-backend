Bookapp::Application.routes.draw do
  resources :stories do
    resources :blocks
  end

  resource :history
end
