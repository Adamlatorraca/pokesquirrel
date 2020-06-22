class SquirrelController < ApplicationController
    get '/squirrels' do
        redirect_if_not_logged_in
        if logged_in?
            redirect to '/users/:id'
        end
    end
    get '/squirrels/new' do
        redirect_if_not_logged_in
        erb :'squirrels/new'
    end

    post '/squirrels' do
        redirect_if_not_logged_in
        @squirrel = Squirrel.new(params)
        if @squirrel.valid_params?(params)
            redirect to '/squirrels/new'
        end
        @squirrel.save
        redirect to '/squirrels/#{@squirrel.id}'
    end

    get "/squirrels/:id" do
        redirect_if_not_logged_in
        @squirrel = Squirrel.find(params[:id])
        erb :'squirrel/show'
    end

    get '/squirrels/:id/edit' do
        redirect_if_not_logged_in
        @squirrel = Squirrel.find(params[:id])
        erb :'squirrels/edit'
    end


end