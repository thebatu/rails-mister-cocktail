Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "cocktails#index"
  resources :cocktails, only: [:index, :new, :show, :create, :destroy] do
    resources :doses, only: [:create, :destroy], shallow: true
  end
#, shallow: true
  #resources :doses, only: [:destroy] #it is a good idea to have destory outside of nesting on this case

end
