class UsersController < ApplicationController
    configure do
        set :public_folder, 'public'
        set :views, 'app/views'
        enable :sessions
        set :session_secret, ENV['SECRET']
    end

    get '/signup' do
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
end