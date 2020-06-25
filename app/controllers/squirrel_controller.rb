class SquirrelController < ApplicationController
    get '/squirrels' do
        redirect_if_not_logged_in
        @squirrels = Squirrel.all
        @users = User.all
        erb :'squirrels/show'
    end

    get '/squirrels/new' do
        redirect_if_not_logged_in
        erb :'squirrels/new'
    end

    post '/squirrels' do
        redirect_if_not_logged_in
        if Squirrel.valid_params?(params)
            redirect to '/squirrels/new'
        end
        current_user.squirrels.create(params[:squirrel])
        redirect to '/squirrels'
    end

    get '/squirrels/:id/edit' do
        redirect_if_not_logged_in
        @squirrel = Squirrel.find(params[:id])
        erb :'squirrels/edit'
    end

    post '/squirrels/:id' do

    end

# finish edit route
# finish delete route
# fix homepage weirdness
end