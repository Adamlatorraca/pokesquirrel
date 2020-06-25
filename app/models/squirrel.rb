class Squirrel < ActiveRecord::Base
    belongs_to :user

    def self.valid_params?(params)
        return !params[:name] == "" && !params[:fur_color] == "" && !params[:mood] == ""
    end
end