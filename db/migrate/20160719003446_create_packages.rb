class CreatePackages < ActiveRecord::Migration
  def change
    create_table :packages do |t|
      t.string :title
      t.string :dimension
      t.string :description
      t.references :user, index: true, foreign_key: true
      t.references :container, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
