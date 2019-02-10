Rails.application.routes.draw do
  resources :cards do
    collection do
      patch :sort
    end
  end



  resources :lists
  resources :epics

  root 'epics#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
