require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    use Rack::Flash, :sweep => true
    set :session_secret, "top_anime_list_secret"
  end

  get '/' do  
    erb :index
  end

  helpers do
    def current_user
      User.find(session[:user_id])
    end 

    def flash_types
      [:success, :notice, :warning, :error]
    end

    def is_logged_in?
        !!session[:user_id]
    end
  end 
end 
