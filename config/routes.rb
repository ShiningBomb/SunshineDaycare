Rails.application.routes.draw do
  resources :weekly_schedules, only: [:index, :create]
  resources :programs, only: [:index, :new, :create, :edit, :update]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
