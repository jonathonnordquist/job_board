Rails.application.routes.draw do

  root 'general_pages#home'
  
  get 'help'                            => 'general_pages#help'
  
  get 'jobs/index'
  get 'jobs/new'
  get 'jobs/show'

end
