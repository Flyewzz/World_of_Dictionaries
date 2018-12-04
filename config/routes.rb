Rails.application.routes.draw do
  resources :dictionaries
  get 'dictionary/new'
  post 'dictionary/new'
  get 'dictionary/index'
  get 'dictionary/show'
  get 'dictionary/edit'
  get 'dictionary/interactive'
  get 'dictionary/remove/:id' => 'dictionary#destroy'
  root 'dictionaries#index'
end
