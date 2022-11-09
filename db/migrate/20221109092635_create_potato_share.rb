class CreatePotatoShare < ActiveRecord::Migration[7.0]
  def change
    create_table :potato_shares do |t|
      t.decimal :value, null: false
      t.datetime :store_time, null: false

      t.timestamps
    end
  end
end
