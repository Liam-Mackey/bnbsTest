class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
    	t.string :product_name, null: false, unique: true, index: true
    	t.string :product_image, null: false
    	t.string :product_description, null: false

      t.timestamps
    end
  end
end
