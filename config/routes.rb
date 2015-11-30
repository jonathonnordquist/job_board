Rails.application.routes.draw do

  root 'general_pages#home'
  
  get 'help'                            => 'general_pages#help'
  
  get 'jobs'                            => 'jobs#index'
  get 'jobs/new'                        => 'jobs#new'
  get 'job/:id'                         => 'jobs#show'
  post 'jobs'                           => 'jobs#create'

end
