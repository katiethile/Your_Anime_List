class AnimesController < ApplicationController

    get '/animes' do 
        if is_logged_in?
            @user = current_user
            @animes = @user.animes
            erb :'animes/index'
        else 
            redirect '/login'
        end 
    end

    get '/animes/new' do 
        if is_logged_in?
            @user = current_user
        erb :'animes/new'
      else
          redirect '/'
      end 
    end 

    post '/animes' do 
        redirect '/login' unless is_logged_in?
        if !params[:name].empty? #checking if name hash isn't empty for when user creates an anime
        @anime = Anime.create(:name => params[:name], :status => params[:status], :rating => params[:rating])
        #creating anime instance based on provided params hash
        flash[:success] = "You have successfully created a new anime!"
            @anime.user = current_user #making sure that the current user is the one that has access to the anime created
            @anime.save
             redirect "/animes/#{@anime.id}" #redirect to show page if successfully create new anime 
        else 
            flash[:error] = "You inputted in a blank field for anime name"
            redirect '/animes/new'
        end 
    end 

    get '/animes/:id' do 
        @anime = Anime.find_by_id(params[:id])
        if is_logged_in?
            erb :'animes/show'
        else
            redirect '/animes'
        end 
    end 

    get '/animes/:id/edit' do 
       if is_logged_in?
        @anime = Anime.find_by_id(params[:id])
        erb :'animes/edit'
        else
           redirect to '/' 
        end
    end 

    patch '/animes/:id' do 
        @anime = Anime.find_by_id(params[:id])
        if !params[:name].empty? && current_user == @anime.user
            @anime.update(params.except(:_method, :id))
            flash[:success] = "You have successfully edit your anime!"
        redirect '/animes'   
        else 
            flash[:error] = "You have inputted a blank field for name."
            redirect to "/animes/#{params[:id]}/edit"
        end  
    end 

    delete '/animes/:id' do
        @anime = Anime.find_by_id(params[:id])
        if current_user == @anime.user
            @anime.delete
            flash[:error] = "You have successfully deleted your anime!"
        redirect to '/animes'
        end 
    end 
end 
