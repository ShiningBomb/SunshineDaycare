Rails.application.routes.draw do

  post '/programs/:program_id/weekly_schedules/:id/publish', to: 'weekly_schedules#publish', as: 'publish_program_weekly_schedule'

  resources :programs, only: [:index, :new, :create, :edit, :update] do
    resources :weekly_schedules, only: [:index, :create, :publish] do
      resources :daily_schedules, only: [:edit] do
        resources :activities, only: [:new, :create, :edit, :update]
      end
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
