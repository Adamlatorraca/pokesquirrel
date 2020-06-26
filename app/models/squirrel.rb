class Squirrel < ActiveRecord::Base
    belongs_to :user

    def self.valid_params?(params)
        params[:squirrel][:name] != "" && params[:squirrel][:fur_color] != "" && params[:squirrel][:mood] != ""
    end
end