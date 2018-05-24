Rails.application.routes.draw do
  root to: 'contacts#index'
  resources :contacts do
      collection do
      post 'set_limit', to: "contacts#set_limit"
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
