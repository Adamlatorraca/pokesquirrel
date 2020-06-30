class Squirrel < ActiveRecord::Base
    belongs_to :user
    validates :name, presence: true
    validates :fur_color, presence: true
    validates :mood, presence: true
    validates :img_link, presence: true
end