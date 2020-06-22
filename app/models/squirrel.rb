class Squirrel < ActiveRecord::Base
    belongs_to :user

    def self.valid_params?(params)
        return !params[:name].empty? && !params[:fur_color].empty? && !params[:mood].empty?
    end
end