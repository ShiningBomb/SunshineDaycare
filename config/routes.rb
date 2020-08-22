Rails.application.routes.draw do

  post 'manager/programs/:program_id/weekly_schedules/:id/publish', to: 'manager/weekly_schedules#publish', as: 'publish_manager_program_weekly_schedule'

  namespace :manager do
    resources :programs, only: [:index, :new, :create, :edit, :update] do
      resources :weekly_schedules, only: [:index, :create, :publish] do
        resources :daily_schedules, only: [:edit] do
          resources :activities, only: [:new, :create, :edit, :update]
        end
      end
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
