JvRailsAudition::Application.routes.draw do
  resources :game_performances


  root to: 'teams#index'

  resources :teams

  resources :players do
    collection do
      get 'page/:page', action: :index
    end
    get 'report', action: :report
  end

  namespace :sponsor do
    resources :companies
  end

  resources :statistics, only: :index

end
