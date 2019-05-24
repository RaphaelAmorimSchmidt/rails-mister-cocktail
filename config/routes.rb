Rails.application.routes.draw do
  root to: 'cocktails#index'
  resources :doses, only: [:destroy, :edit, :update]
  resources :cocktails, except: :index do
    resources :doses, only: [:new, :create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
