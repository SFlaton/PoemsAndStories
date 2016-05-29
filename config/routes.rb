Rails.application.routes.draw do
  resources :authors do
    resources :poems
    resources :short_stories
  end

  root 'authors#index'
end
