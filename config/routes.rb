Rails.application.routes.draw do
  get 'dictionary/new'
  post 'dictionary/new'
  get 'dictionary/index'
  get 'dictionary/show'
  get 'dictionary/edit'
  get 'dictionary/interactive'
  get 'dictionary/remove/:id' => 'dictionary#destroy'
  root 'dictionary#index'
end
