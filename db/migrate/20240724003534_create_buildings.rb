class CreateBuildings < ActiveRecord::Migration[7.1]
  def change
    create_table :buildings do |t|
      t.string :street_address
      t.string :city
      t.string :state
      t.string :postcode
      t.string :country
      t.references :client, null: false, foreign_key: true

      t.timestamps
    end
  end
end
