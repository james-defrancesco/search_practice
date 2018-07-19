Rails.application.routes.draw do
  root to: 'people#index'
  resources :people, only: [:show, :index] do
    match :search, to: 'people#index', via: :post, on: :collection
  end
end

