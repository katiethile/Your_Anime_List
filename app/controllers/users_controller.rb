class UsersController < ApplicationController
    get '/signup' do 
        if is_logged_in? 
            redirect to '/animes'
        else 
            erb :'users/signup' 
        end 
    end 

    post '/signup' do
        user = User.create(:username => params[:username], :email => params[:email], :password => params[:password])
        if user.save
          session[:user_id] = user.id  
          redirect to "/animes"
        else
            flash[:error] = "You inputted invalid fields for Username, Email and Password; or Username/Email is already taken."
          redirect '/signup'
        end
    end

    get '/login' do 
        if is_logged_in?
            redirect to '/animes'
        else
        erb :'users/login' 
        end
    end

    post "/login" do
        user = User.find_by(:username => params[:username]) 
      if user && user.authenticate(params[:password]) 
          session[:user_id] = user.id 
          redirect to "/animes"
    else 
        flash[:error] = "You inputted in invalid fields for username or password"
        redirect '/login'
    end 
end 

    get '/logout' do
        session.clear
        redirect to '/'
    end
end 