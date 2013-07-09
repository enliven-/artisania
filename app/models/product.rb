class Product < ActiveRecord::Base

  attr_accessible :name, :description, :product_category, :catalog

  belongs_to :catalog
  has_one    :product_category

end
