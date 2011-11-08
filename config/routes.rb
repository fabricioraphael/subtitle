Subtitle::Application.routes.draw do
  root :to => "home#index"
  resources :home
  
  match "upload" => "home#upload"
  match "download" => "home#download"
end
