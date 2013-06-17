class CreateAttributes < ActiveRecord::Migration
  def change
    create_table :attributes do |t|
      t.string    :name
      t.integer   :attribute_layer_id

      t.timestamps
    end
  end
end
