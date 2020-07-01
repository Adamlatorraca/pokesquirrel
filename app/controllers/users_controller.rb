class UsersController < ApplicationController
    configure do
        set :public_folder, 'public'
        set :views, 'app/views'
        enable :sessions
        set :session_secret, ENV['SECRET']
    end

    get '/' do
        erb :index
    end

    get '/signup' do
        erb :'users/signup'
    end

    post '/signup' do
        user = User.new(params[:user])
        if user.save
            session[:user_id] = user.id
            redirect to '/squirrels'
        else
            erb :'users/signup'
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
            @error = "Error!"
            erb :'users/login'
            # if you have a form error, you must re-render the form
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