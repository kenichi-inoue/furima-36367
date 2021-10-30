class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :product_name,null: false, default: ""
      t.text :product_discription
      t.integer :product_category_id
      t.integer :product_condition_id
      t.integer :shipping_burden_id 
      t.integer :shipping_area_id 
      t.integer :days_to_ship_id  
      t.integer :purchase_price 
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
