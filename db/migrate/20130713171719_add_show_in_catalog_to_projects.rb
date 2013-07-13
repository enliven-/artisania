class AddShowInCatalogToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :show_in_catalog, :boolean, default: false
    add_column :projects, :product_category_id, :integer
  end
end
