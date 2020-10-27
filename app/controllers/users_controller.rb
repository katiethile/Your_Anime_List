class UsersController < ApplicationController
    get '/signup' do 
        if is_logged_in? #checks if user is logged in
            redirect to '/animes'
        else 
            erb :'users/signup' #loads signup form if user is not logged in
        end 
    end 

    post '/signup' do
        #gets the users' info from the params hash 
        user = User.create(:username => params[:username], :email => params[:email], :password => params[:password])
        #this is where a user will get created, via a post request, with the params provided (username, email and password)
        if user.save
            #after user is created, user will be saved; Calling user.save will return false if the user can't be persisted.
          session[:user_id] = user.id # session hash wil allow user to immediately go to main personal homepage upon signing up 
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
        user = User.find_by(:username => params[:username]) #finds user by username
      if user && user.authenticate(params[:password]) # checks if we found a user with that username 
        #checks if users' password matche up with password digest 
          session[:user_id] = user.id #if user is authenticated, user will be redirected to /animes 
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