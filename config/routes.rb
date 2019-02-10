Rails.application.routes.draw do

  devise_for :users
  resources :projects
  root 'projects#index'

  resources :cards do
    collection do
      patch :sort
    end
  end

  resources :lists
  resources :epics


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
