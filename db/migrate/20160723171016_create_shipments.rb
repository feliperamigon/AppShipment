class CreateShipments < ActiveRecord::Migration
  def change
    create_table :shipments do |t|
      t.references :package, index: true, foreign_key: true
      t.references :container, index: true, foreign_key: true
      t.string :status

      t.timestamps null: false
    end
  end
end
