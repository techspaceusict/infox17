Rails.application.routes.draw do
  
  
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "home#index"

  get '/'=> 'home#index'
  
  get '/about'=>'home#about'

  get '/schedule'=>'home#schedule'

  get '/events'=>'home#events'

  get '/team'=>'home#team'

  get '/Contact'=>'home#Contact'
 
end
