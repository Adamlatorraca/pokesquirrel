class SquirrelController < ApplicationController
    get '/squirrels' do
        redirect_if_not_logged_in
        @squirrels = Squirrel.all
        @users = User.all
        erb :'squirrels/index'
    end

    get '/squirrels/new' do
        redirect_if_not_logged_in
        erb :'squirrels/new'
    end

    get '/squirrels/:id/edit' do
        redirect_if_not_logged_in
        @squirrel = Squirrel.find(params[:id])
        @user = @squirrel.user
        if @user == current_user
            erb :'squirrels/edit'
        else
            redirect to '/squirrels'
        end
        
    end

    get '/squirrels/:id' do
        @squirrel = Squirrel.find(params[:id])
        erb :'squirrels/show'
    end

    post '/squirrels' do
        redirect_if_not_logged_in
        if Squirrel.valid_params?(params)
            redirect to '/squirrels/new'
        end
        current_user.squirrels.create(params[:squirrel])
        redirect to '/squirrels'
    end

    patch '/squirrels/:id' do
        redirect_if_not_logged_in
        @squirrel = Squirrel.find(params[:id])
        @squirrel.update(params[:squirrel])
        redirect to "/squirrels/#{@squirrel.id}"
    end

    delete '/squirrels/:id' do
        redirect_if_not_logged_in
        @squirrel = Squirrel.find(params[:id])
        @user = @squirrel.user
        if @user == current_user
            @squirrel.destroy
            redirect to '/squirrels'
        else
            redirect to '/squirrels'
        end
    end
end