class Attribute < ActiveRecord::Base

  attr_accessible :name
  
  has_attached_file :attr_img, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  
  belongs_to :attribute_layer

end
