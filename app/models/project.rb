class Project < ActiveRecord::Base

  attr_accessible :name, :description, :img_file
  has_attached_file :img_file, :styles => { :large => "600x600>", :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  
  has_many   :palettes, dependent: :destroy

  # has_many  :attribute_layers, :through => :palette
  # has_many  :attributes,       :through => :attribute_layers


  # accepts_nested_attributes_for :palette
  # accepts_nested_attributes_for :attributes
  # accepts_nested_attributes_for :attribute_layers

end
