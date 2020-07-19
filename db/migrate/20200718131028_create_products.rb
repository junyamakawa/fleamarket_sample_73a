class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string        :name,            null: false
      t.text          :description,     null: false
      t.integer       :category,        null: false, foreign_key: true
      t.string        :brand
      t.integer       :condition,       null: false, foreign_key: true
      t.integer       :delivery_cost,   null: false
      t.integer	      :region,          null: false, foreign_key: true
      t.integer       :preparation_day, null: false, foreign_key: true
      t.integer       :price,           null: false
      t.references	  :user,            null: false, foreign_key: true
      t.timestamps
    end
  end
end
