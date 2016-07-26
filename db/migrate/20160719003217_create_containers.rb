class CreateContainers < ActiveRecord::Migration
  def change
    create_table :containers do |t|
      t.string :title
      t.string :origin
      t.string :destiny
      t.string :shipping_day
      t.references :user, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
