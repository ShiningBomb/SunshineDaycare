Rails.application.routes.draw do
  namespace :parents do
    root :to => "children#index"
    resources :children, only: [:index, :new, :create, :edit, :update]
  end

  get 'welcome/index'

  devise_for :parents

  root to: "welcome#index"
  post 'manager/programs/:program_id/weekly_schedules/:id/publish', to: 'manager/weekly_schedules#publish', as: 'publish_manager_program_weekly_schedule'
  
  namespace :manager do
    root :to => "programs#index"
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
