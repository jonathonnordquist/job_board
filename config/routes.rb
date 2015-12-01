Rails.application.routes.draw do

  root 'general_pages#home'
  
  get 'help'                            => 'general_pages#help'
  
  resources 'jobs'
  
  get 'job/ft'                             => 'jobs#full_time'
  get 'job/pt'                             => 'jobs#part_time'
  get 'job/cont'                           => 'jobs#contract'
  get 'job/fl'                             => 'jobs#free_lance'

end
