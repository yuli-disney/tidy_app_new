Rails.application.routes.draw do
  get "/" => "post#index"
  post "/logout" => "user#logout"
  post "/users/create" =>"user#create"
  post "/posts/create" => "post#create"
  post "posts/:id/update" => "post#update"
  post "/posts/option_create" => "post#option_create"
  get "/posts/login" => "post#login"
  get "/posts/newuser" =>"post#newuser"
  post "users/login" => "user#login"
  get "/posts/option/:id"  =>"post#each_option" 
  get "posts/often" =>"post#often"
  get "posts/wanna_save" => "post#save"
  get "/posts/:id" => "post#edit"
  post "/posts/:id/destroy" => "post#destroy"
  get "users/new" => "user#new"
  post "/posts/:id/destroyoption" => "post#destroyoption"
  
  
  
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
