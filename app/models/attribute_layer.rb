class AttributeLayer < ActiveRecord::Base
  # attr_accessible :title, :body
  has_many :attributes

  accepts_nested_attributes_for :attributes
  
end
