class SquirrelController < ApplicationController
    get '/squirrels' do
        erb :'squirrels/index'
    end
end