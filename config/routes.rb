Rails.application.routes.draw do
  root to: 'pages#top'
  get 'about', to: 'pages#about'
  get 'faq', to: 'pages#faq'
  get 'privacy_policy', to: 'pages#privacy_policy'
  get 'tokutei', to: 'pages#tokutei'
  get 'sign_up', to: 'registrations#new'
  post 'sign_up', to: 'registrations#create'
  get 'sign_in', to: 'sessions#new'
  post 'sign_in', to: 'sessions#create'
  delete 'sign_out', to: 'sessions#destroy'

  get 'salon_sign_in', to: 'salon_sessions#new'
  post 'salon_sign_in', to: 'salon_sessions#create'
  delete 'salon_sign_out', to: 'salon_sessions#destroy'


  resource :user, only: %w[show edit update destroy]
  resource :salon
end
