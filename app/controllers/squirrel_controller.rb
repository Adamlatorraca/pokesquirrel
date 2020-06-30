class SquirrelController < ApplicationController
    get '/squirrels' do
        redirect_if_not_logged_in
        all_squirrels
        erb :'squirrels/index'
    end

    get '/squirrels/new' do
        redirect_if_not_logged_in
        erb :'squirrels/new'
    end

    get '/squirrels/:id/edit' do
        find_or_redirect_if_not_authorized
        erb :'squirrels/edit'
    end

    get '/squirrels/:id' do
        find_or_redirect_if_not_logged_in
        erb :'squirrels/show'
    end

    post '/squirrels' do
        create_squirrel
        redirect to '/squirrels'
    end

    patch '/squirrels/:id' do
        find_or_redirect_if_not_authorized
        update_squirrel
        redirect to "/squirrels/#{@squirrel.id}"
    end

    delete '/squirrels/:id' do
        find_or_redirect_if_not_authorized
        delete_squirrel
        redirect to '/squirrels'
    end

    private

    def logged_in?
        !!session[:user_id]
      end
  
      def current_user
          @current_user ||= User.find_by_id(session[:user_id])
      end
  
      def redirect_if_not_logged_in
        if !logged_in?
          redirect to '/login'
        end
      end
  
      def authorized?
        @squirrel.user == current_user
      end
  
      def redirect_if_not_authorized
        if !authorized?
          redirect to '/squirrels'
        end
      end
  
      def find_squirrel
        @squirrel = Squirrel.find(params[:id])
      end
  
      def find_or_redirect_if_not_logged_in
        find_squirrel
        redirect_if_not_logged_in
      end
  
      def find_or_redirect_if_not_authorized
        find_squirrel
        redirect_if_not_authorized
      end

      def all_squirrels
        @squirrels = Squirrel.all.includes(:user)
      end

      def create_squirrel
        current_user.squirrels.create(params[:squirrel])
      end

      def update_squirrel
        @squirrel.update(params[:squirrel])
      end

      def delete_squirrel
        @squirrel.destroy
      end
end