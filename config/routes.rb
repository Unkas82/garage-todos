Rails.application.routes.draw do

  # (see Api::V1::ProjectsController)
  root to: 'api/v1/projects#index'

  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      resources :projects, only: %i[index create update destroy] do
        resources :tasks, only: %i[create update destroy] do
          patch 'move' => 'tasks#move'
          resources :comments, only: %i[create update destroy]
        end
      end
    end
  end
end
