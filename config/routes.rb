Rails.application.routes.draw do
  root to: 'pages#top'
  get 'about', to: 'pages#about'
end
