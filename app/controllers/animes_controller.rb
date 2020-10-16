class AnimesController < ApplicationController

    get '/animes' do 
        if is_logged_in?
            #binding.pry
            @user = current_user
            @animes = @user.animes
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
       # binding.pry
        if is_logged_in?
            @anime = Anime.create(:name => params[:name], :status => params[:status], :rating => params[:rating])
            @anime.user = current_user
            @anime.save
             redirect to "/animes/#{@anime.id}"
        else
            redirect '/animes/new'
        end 
    end 

    get '/animes/:id' do 
        #binding.pry
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
        case @anime.rating
        when 1
            @oneselect = "selected"
        when 2
            @twoselect = "selected"
        when 3
            @threeselect = "selected"
        when 4
            @fourselect = "selected"
        when 5
            @fiveselect = "selected"
        when 6
            @sixselect = "selected"
        when 7
            @sevenselect = "selected"
        when 8
            @eightselect = "selected"
        when 9
            @nineselect = "selected"
        when 10
            @tenselect = "selected"
        end
        erb :'animes/edit'
        else
           redirect to '/' 
        end
    end 

    patch '/animes/:id' do 
        @anime = Anime.find_by_id(params[:id])
        if current_user == @anime.user
            @anime.update(params.except(:_method, :id))
        redirect to '/animes'
        end 
    end 

    delete '/animes/:id' do
        @anime = Anime.find_by_id(params[:id])
        if current_user == @anime.user
            @anime.delete
        redirect to '/animes'
        end 
    end 
end 
