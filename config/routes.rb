Rails.application.routes.draw do

  devise_for :users
  root to: "dashboards#home"

  resources :users do
    resources :exercises
  end

end
