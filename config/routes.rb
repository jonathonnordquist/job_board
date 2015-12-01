Rails.application.routes.draw do

  root 'general_pages#home'
  
  get 'help'                            => 'general_pages#help'
  
  resources 'jobs'
  
  # get 'jobs'                            => 'jobs#index'
  # get 'job/new'                         => 'jobs#new'
  # get 'job/:id'                         => 'jobs#show'
  # post 'job'                            => 'jobs#create'

end
