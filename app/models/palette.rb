class Palette < ActiveRecord::Base
  
  attr_accessible :name, :project_id, :user_id, :attribute_layers_attributes

  validates :name, :presence  => true

  belongs_to :project

  has_one  :product_category

  has_many :attribute_layers
  
  # has_many :attributes, :through => :attribute_layers
  accepts_nested_attributes_for :attribute_layers

end
