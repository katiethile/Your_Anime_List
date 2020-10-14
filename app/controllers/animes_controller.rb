class AnimesController < ApplicationController

    get '/animes' do 
        if is_logged_in?
            @user = current_user
            @animes = Anime.all 
            erb :'animes/index'
        else 
            redirect '/login'
        end 
    end

    get '/animes/new' do 
        @anime = Anime.find_by_id(params[:id])
        if is_logged_in?
            @user = current_user
        erb :'animes/new'
      else
          redirect '/'
      end 
    end 

    post '/animes' do 
        @anime = Anime.create(:name => params[:name], :status => params[:status], :user_id => current_user.id)
        if is_logged_in? && user.anime.status == currently_watching && user.anime.status == dropped && user.anime.status == completed && user.anime.status == on_hold
             redirect to "/animes/#{@anime.id}"
        else
            redirect '/animes/new'
        end 
    end 

    get '/animes/:id' do 
        @anime = Anime.find_by_id(params[:id])
        if is_logged_in?
            erb :'animes/show'
        else
        redirect to '/'
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
    end 

    delete '/animes/:id' do
        id = params[:id]
        @anime = Anime.find_by_id(params[:id])
        if current_user == @anime.user
            @anime.destroy 
        redirect to '/animes'
        end 
    end 
end 