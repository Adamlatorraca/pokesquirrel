class SquirrelController < ApplicationController
    get '/squirrels' do
        redirect_if_not_logged_in
        @squirrels = Squirrel.all.includes(:user)
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
        redirect_if_not_logged_in
        current_user.squirrels.create(params[:squirrel])
        redirect to '/squirrels'
    end

    patch '/squirrels/:id' do
        find_or_redirect_if_not_authorized
        @squirrel.update(params[:squirrel])
        redirect to "/squirrels/#{@squirrel.id}"
    end

    delete '/squirrels/:id' do
        find_or_redirect_if_not_authorized
        @squirrel.destroy
        redirect to '/squirrels'
    end

    private
  
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
end