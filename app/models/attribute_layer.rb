class AttributeLayer < ActiveRecord::Base

  attr_accessible :name, :palette

  # belongs_to :palette
  has_many :attributes

  accepts_nested_attributes_for :attributes
  
end
