class UsersController < ApplicationController
    configure do
        set :public_folder, 'public'
        set :views, 'app/views'
        enable :sessions
        set :session_secret, "fillwithdotenv"
    end
end