Subtitle::Application.routes.draw do
  root :to => "home#index"
  resources :home

end
