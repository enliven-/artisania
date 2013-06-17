class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string      :name
      t.text        :description
      t.integer     :product_category_id
      t.integer     :palette_id
      t.integer     :attribute_layer_id
      t.integer     :attribute_id

      t.timestamps
    end
  end
end
