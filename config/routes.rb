Rails.application.routes.draw do

  post '/weekly_schedules/:id/publish', to: 'weekly_schedules#publish', as: 'publish_weekly_schedule'

  resources :weekly_schedules, only: [:index, :create, :publish] do
    resources :daily_schedules, only: [:edit] do
      resources :activities, only: [:new, :create, :edit, :update]
    end
  end
  resources :programs, only: [:index, :new, :create, :edit, :update]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
