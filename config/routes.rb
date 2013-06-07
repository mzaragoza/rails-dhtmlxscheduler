RailsDhtmlxscheduler::Application.routes.draw do
  match 'events/save' => 'events#save', as: :save
  resources :events
  root :to => 'pages#index'
end
