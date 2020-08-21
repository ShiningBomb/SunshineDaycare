Rails.application.routes.draw do
  get 'daily_schedule/edit'

  resources :weekly_schedules, only: [:index, :create, :edit] do
    resources :daily_schedules, only: [:edit]
  end
  resources :programs, only: [:index, :new, :create, :edit, :update]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
