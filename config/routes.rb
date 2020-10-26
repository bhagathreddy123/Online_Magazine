Rails.application.routes.draw do
  resources :articles do
    resources :comments
  end
  root 'articles#index'
  resources :events
  
end
