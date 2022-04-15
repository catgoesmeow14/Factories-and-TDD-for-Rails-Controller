Rails.application.routes.draw do
  get 'food/index'
  get 'food/create'
  get 'food/new'
  get 'food/destroy'
  get 'food/show'
  get 'food/update'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
