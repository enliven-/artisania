class AttributeLayer < ActiveRecord::Base

  attr_accessible :name, :palette_attributes_attributes

  belongs_to :palette
  
  has_many :palette_attributes, :class_name => 'Attribute'
  accepts_nested_attributes_for :palette_attributes, :reject_if => :all_blank, :allow_destroy => true
  
end
