Rails.application.routes.draw do
  root to: "welcome#index"
  
  get 'welcome/index'

  devise_for :parents
  namespace :parents do
    root :to => "children#index"
    resources :timeline, only: :index do
      get 'save'
    end
    resources :children, only: [:index, :new, :create, :edit, :update] do
      resources :weekly_schedules, only: [:index] do
        resources :daily_schedules, only: [:show]
      end
    end
  end

  devise_for :caretakers
  namespace :caretakers do
    root :to => "posts#index"
    resources :posts, only: [:index, :new, :create, :edit, :update]
  end

  #post 'manager/programs/:program_id/weekly_schedules/:id/publish', to: 'manager/weekly_schedules#publish', as: 'publish_manager_program_weekly_schedule'
  namespace :manager do
    root :to => "programs#index"
    resources :programs, only: [:index, :new, :create, :edit, :update] do
      resources :weekly_schedules, only: [:index, :create, :publish] do
        post 'publish'
        resources :daily_schedules, only: [:edit] do
          resources :activities, only: [:new, :create, :edit, :update]
        end
      end
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
