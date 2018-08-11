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

  get 'staff_sign_in', to: 'staff_sessions#new'
  post 'staff_sign_in', to: 'staff_sessions#create'
  delete 'staff_sign_out', to: 'staff_sessions#destroy'

  get 'salon_sign_in', to: 'salon_sessions#new'
  post 'salon_sign_in', to: 'salon_sessions#create'
  delete 'salon_sign_out', to: 'salon_sessions#destroy'

  resources :users  do
    collection do
      get :areas_select
    end
  end

  # 連動プルダウン
  get 'prefectures/areas'
  # get 'areas/prefecture' エリアから都道府県はなし

  resources :users #, only: %w[index show edit update destroy areas]
  resources :salons
  resources :staffs
  resource :room
  resource :message
end
