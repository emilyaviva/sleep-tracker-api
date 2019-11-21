Rails.application.routes.draw do
  resources :people do
    resources :sleep_periods
  end
end
