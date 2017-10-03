# Project For Techspace
  # Code Verifed Date : 10/09/2017
  # Programmers : Mainsh, Navin
  # Developers : Jeevan Prakash Pant, Prabhanshu Gupta
  # Checked, standardized and Verified by : Jeevan Prakash Pant, Prabhanshu Gupta
  # Check No. 9821
  # For any changes  or queries contact <jeevanppant@gmail.com><guptaprabhanshu1@gmail.com>
  #
  # NOTE: Any progarmmer/coder who needs to make changes in this file should contact Developers

Rails.application.routes.draw do
  
  get '/users/sign_in' =>'home#ts_index'
  get '/users/sign_up' =>'home#ts_index'

  get 'update_profile/profile'

  get 'update_profile/show'

  get 'event/event'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  #devise_for :users

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  # devise_scope :user do
  #    delete 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  # end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  # Default Controller

  root :to => "home#ts_index"


  # GET Requests

  get '/'=> 'home#ts_index'

  #get '/home' => 'home#ts_index'

  get '/team'=>'home#ts_team'

  get '/about'=>'home#ts_about'

  get '/schedule'=>'home#ts_schedule'

  get '/events'=>'home#events'

  get '/sponsors'=>'home#ts_sponsors'

  get '/contact'=>'home#ts_contact'

  get '/addinfoxevent'=>'event#addinfoxevent'

  get '/event'=>'event#event'

  get '/profile'=>'update_profile#profile'
  post '/update'=>'update_profile#update'
  get '/show'=>'update_profile#show'


  get '/event/event'=>'event#event'

  get '/myevents'=>'event#myevents'

  post '/addevents'=>'event#addevents'

  get '/eventregister'=>'event#eventregister'

  post '/eventquery'=>'event#eventquery'

  # RESTFUL Requests

  namespace 'api' do

    namespace 'v1' do
      get '/allevent' =>'articles#allevent'
      get '/eventbyid'=>'articles#eventbyid'
    end

  end

end
