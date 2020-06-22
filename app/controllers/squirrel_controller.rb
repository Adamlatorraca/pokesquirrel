class SquirrelController < ApplicationController
    get '/squirrels' do
        redirect_if_not_logged_in
        @squirrels = Squirrel.all
        erb :'squirrels/index'
    end

    get '/squirrels/new' do
        redirect_if_not_logged_in
        erb :'squirrels/new'
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

    post '/squirrels' do
        redirect_if_not_logged_in
        @squirrel = Squirrel.new(create)
        if @squirrel.valid_params?(params)
            redirect to '/squirrels/new'
        end
        @squirrel.save
        redirect "/squirrels/#{@squirrel.id"
    end
end