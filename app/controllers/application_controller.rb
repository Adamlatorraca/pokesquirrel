require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, ENV['SECRET']
  end

  get "/" do
    erb :index
  end

  helpers do
    def logged_in?
        !!session[:user_id]
    end

    def current_user  #memoization
        @current_user ||= User.find_by_id(session[:user_id])

        # if @current_user
        #     @current_user
        # else
        #     @current_user = User.find_by_id(session[:user_id])
        # end
    end

    def redirect_if_not_logged_in
      if !logged_in?
        redirect to '/login'
      end
    end
  end
end
