Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :floorplans
      resources :projects
      resources :users
    end
  end

  root to: 'application#route_not_found', via: :all
  match '*unmatched', to: 'application#route_not_found', via: :all
end
