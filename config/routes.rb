Rails.application.routes.draw do
  get 'quizzes/new'

  get 'users/new'

  root 'static_pages#home'
  get  '/help',    to: 'static_pages#help'
  get  '/about',   to: 'static_pages#about'
  get  '/contact', to: 'static_pages#contact'
  get  '/faqs', to: 'static_pages#faqs'
  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'
  get    '/new_quiz', to: 'quizzes#new'
  post '/new_quiz', to: 'quizzes#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :users
  resources :quizzes
end
