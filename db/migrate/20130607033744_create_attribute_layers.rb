class CreateAttributeLayers < ActiveRecord::Migration
  def change
    create_table :attribute_layers do |t|
      t.string      :name
      t.integer     :palette_id

      t.timestamps
    end
  end
end
