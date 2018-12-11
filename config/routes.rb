Rails.application.routes.draw do
  scope "(:locale)", locale: /#{I18n.available_locales.join('|')}/ do
    get 'test/settings'
    get 'test/start'
    get 'test/result'
    devise_for :users
    get 'persons/profile'
    resources :dictionaries
    get 'dictionary/new'
    post 'dictionary/new'
    get 'dictionary/index'
    get 'dictionary/show'
    get 'dictionary/edit'
    get 'dictionary/interactive'
    get 'dictionary/remove/:id' => 'dictionary#destroy'
    get 'persons/profile', as: 'user_root'
    root 'test#settings'
  end
end
