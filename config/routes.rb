Rails.application.routes.draw do

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
