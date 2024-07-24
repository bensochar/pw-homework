class CreateBuildings < ActiveRecord::Migration[7.1]
  def change
    create_table :buildings do |t|
      t.string :street_address, null: false
      t.string :city, null: false
      t.string :state, null: false
      t.string :postcode, null: false
      t.string :country, null: false
      t.references :client, null: false, foreign_key: true

      t.timestamps
    end
  end
end
