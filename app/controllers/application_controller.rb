require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, ENV['SECRET']
    set :show_exceptions, false
  end

  not_found do
    status 404
    erb :error
  end

  get '/' do
    erb :index
  end

  error ActiveRecord::RecordNotFound do
    redirect to '/squirrels'
  end

  helpers do
    def logged_in?
      !!session[:user_id]
    end
  end
end
