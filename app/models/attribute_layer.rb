class AttributeLayer < ActiveRecord::Base


  attr_accessible :name

  belongs_to :palette
  has_many   :attributes
  accepts_nested_attributes_for :attributes, :reject_if => :all_blank, :allow_destroy => true
  
end
