require './config/environment'

require 'sinatra/base'
require 'rack-flash'

class ApplicationController < Sinatra::Base
  use Rack::Flash

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "top_anime_list_secret"
  end

  get '/' do  
    erb :index
  end

  helpers do
    def current_user
      User.find(session[:user_id])
    end 

    def is_logged_in?
        !!session[:user_id]
    end
  end 
end 
