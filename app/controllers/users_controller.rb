class UsersController < ApplicationController

    get '/' do  
        @user = current_user if is_logged_in?
        erb :index
    end
end 