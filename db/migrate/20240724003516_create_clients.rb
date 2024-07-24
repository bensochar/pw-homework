class CreateClients < ActiveRecord::Migration[7.1]
  def change
    create_table :clients do |t|
      t.string :email, null: false
      t.string :password_digest, null: false
      t.string :name, null: false

      t.timestamps
    end
  end
end
