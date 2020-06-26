class AddSquirrelImageLink < ActiveRecord::Migration
  def change
    add_column :squirrels, :img_link, :string
  end
end
