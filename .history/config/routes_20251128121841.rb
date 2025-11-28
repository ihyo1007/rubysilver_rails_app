Rails.application.routes.draw do
  get "quiz/random"
  get "quiz/result"
  get "users/mypage"
  get "home/index"
  root 'home#index' 
  devise_for :users 
  resources :questions do 
    post :answer, on: :member # /questions/:id/answer 
  end 
  get 'quiz', to: 'quiz#home'
  post 'quiz/start', to: 'quiz#start'
  get 'quiz/random', to: 'quiz#random' 
  post 'quiz/answer', to: 'quiz#answer' 
  get 'quiz/result', to: 'quiz#result'
  get 'mypage', to: 'users#mypage'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
end
