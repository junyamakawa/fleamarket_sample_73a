class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string  :name, null: false
      t.text    :description, null: false
      t.string  :brand
      t.integer :condition_id, foreign_key: true
      t.integer :delivery_cost_id, foreign_key: true
      t.integer :region_id, foreign_key: true
      t.integer :preparation_day_id, foreign_key: true
      t.integer :price, null:false
      t.integer :user_id, foreign_key: true
      t.integer  :status,  null: false, defalut: 0
      t.timestamps
    end
  end
end
