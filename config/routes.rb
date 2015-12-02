Rails.application.routes.draw do

  get 'sessions/new'

  root 'general_pages#home'
  
  get 'help'                               => 'general_pages#help'
  
  resources 'jobs'
  resources 'users'
  
  get 'job/ft'                             => 'jobs#full_time'
  get 'job/pt'                             => 'jobs#part_time'
  get 'job/cont'                           => 'jobs#contract'
  get 'job/fl'                             => 'jobs#free_lance'
  
  get 'login'                              => 'sessions#new'
  post 'login'                             => 'sessions#create'
  delete 'logout'                          => 'sessions#destroy'
  
  get 'apply/:id'                          => 'user_apps#new'

end
