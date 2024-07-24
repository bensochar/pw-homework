class CreateCustomFields < ActiveRecord::Migration[7.1]
  def change
    create_table :custom_fields do |t|
      t.string :type
      t.jsonb :config, null: false, default: '{}'
      t.references :client, null: false, foreign_key: true

      t.timestamps
    end
  end
end
