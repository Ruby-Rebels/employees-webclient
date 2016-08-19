Rails.application.routes.draw do
  get '/employees' => 'employees#index'
  get '/employees/new' => 'employees#new'
  get '/employees/:id' => 'employees#show'
  get '/employees/:id/edit' => 'employees#edit'
  patch '/employees/:id' => 'employees#update'
  post '/employees' => 'employees#create'
  delete '/employees/:id' => 'employees#destroy'
end
