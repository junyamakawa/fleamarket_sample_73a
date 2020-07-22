class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string        :name,            null: false
      t.text          :description
      t.integer       :category_id,        null: false, foreign_key: true
      t.string        :brand
      t.integer       :condition_id,       null: false, foreign_key: true
      t.integer       :delivery_cost,   null: false
      t.integer	      :region_id,          null: false, foreign_key: true
      t.integer       :preparation_day_id, null: false, foreign_key: true
      t.integer       :price,           null: false
      t.integer	  :user_id,            null: false, foreign_key: true

      t.timestamps
    end
  end
end
