class AttributeLayer < ActiveRecord::Base

  attr_accessible :name, :palette, :attributes_attributes

  belongs_to :palette
  has_many   :attributes
  accepts_nested_attributes_for :attributes
  
end
