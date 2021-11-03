class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :product_name,null: false, default: ""
      t.text :product_discription,null: false
      t.integer :product_category_id,null: false
      t.integer :product_condition_id,null: false
      t.integer :shipping_burden_id,null: false
      t.integer :shipping_area_id,null: false
      t.integer :days_to_ship_id,null: false
      t.integer :purchase_price,null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
