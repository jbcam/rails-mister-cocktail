Rails.application.routes.draw do
  root to: 'cocktails#index'
  # For detect { ||  }ails on the DSL available within this file, see http://guides.rubyonrails.org/routing.htm
  resources :cocktails, only: [:show, :new, :create]

  resources :cocktails do
    resources :doses, only: [:new, :create]
  end
end
