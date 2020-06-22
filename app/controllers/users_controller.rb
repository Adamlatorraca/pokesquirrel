class UsersController < ApplicationController
    configure do
        set :public_folder, 'public'
        set :views, 'app/views'
        enable :sessions
        set :session_secret, ENV['SECRET']
    end

    get '/signup' do
        redirect_if_logged_in
        erb :'users/new'
    end

    post '/signup' do
        user = User.new(params[:user])
        if user.save
            session[:user_id] = user.id
            redirect to '/squirrels'
        else
            erb :'users/new'
        end
    end

    get '/login' do
        redirect_if_logged_in
        erb :'users/login'
    end

    post '/login' do
        user = User.find_by_username(params[:user][:username])
        if user && user.authenticate(params[:user][:password])
            session[:user_id] = user.id
            redirect to '/squirrels'
        else
            redirect to '/login'
        end
    end

    get '/logout' do
        if session[:user_id] != nil
          session.destroy
          redirect to '/login'
        else
          redirect to '/'
        end
    end
end