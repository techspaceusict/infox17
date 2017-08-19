Rails.application.routes.draw do
  
  
  get 'event/event'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  

  #devise_for :users

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  # devise_scope :user do
  #    delete 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  # end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "home#index"

  get '/'=> 'home#index'
  get '/team'=>'home#team'
  
  get '/about'=>'home#about'

  get '/schedule'=>'home#schedule'

  get '/events'=>'home#events'

  get '/Sponsers'=>'home#Sponsers'

  get '/Contact'=>'home#Contact'

  post '/event/event'=>'event#event'

  post '/myevents'=>'event#myevents'
 
   get '/addinfoxevent'=>'event#addinfoxevent'

   post '/addevents'=>'event#addevents'

   get '/event'=>'event#event'

   post '/eventregister'=>'event#eventregister'

   post '/eventquery'=>'event#eventquery'

   
   namespace 'api' do

    namespace 'v1' do
      get '/allevent' =>'articles#allevent'
      get '/eventbyid'=>'articles#eventbyid'
    end
   end

end
