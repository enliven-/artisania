class Project < ActiveRecord::Base

  attr_accessible :name, :description, :product_category
  
  has_many   :palettes, dependent: :destroy
  # has_many  :attribute_layers, :through => :palette
  # has_many  :attributes,       :through => :attribute_layers


  # accepts_nested_attributes_for :palette
  # accepts_nested_attributes_for :attributes
  # accepts_nested_attributes_for :attribute_layers

end
