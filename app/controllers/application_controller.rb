require './config/environment'

class ApplicationController < Sinatra::Base

  #Sinatra is a web framework application; DSL; provides verb methods like gets and post; responds to HTTP requests; 
  #pre written methods; 
  configure do
    #The configure block above is a part of built-in settings that control whether features are enabled or not. 
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions #letting us have access to session keyword; turning session on 
    use Rack::Flash, :sweep => true #enabling flash message 
    set :session_secret, "top_anime_list_secret" #an encryption key that will be used to create a session_id; able to keep our sessions safe from outsiders 
  end

  get '/' do  
    erb :index
  end

  helpers do
    def current_user
      User.find(session[:user_id]) #returns the instance of the logged in user, based on the session[:user_id]
    end 

    def flash_types
      [:success, :notice, :warning, :error] #flash warning types that will be used in views and controllers 
    end

    def is_logged_in?
        !!session[:user_id] #returns true or false based on the presence of a session[:user_id]
    end
  end 
end 
