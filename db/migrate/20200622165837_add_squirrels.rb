class AddSquirrels < ActiveRecord::Migration
  def change
    create_table :squirrels do |t|
      t.string :name
      t.string :fur_color
      t.string :mood
      t.belongs_to :user
    end
  end
end
