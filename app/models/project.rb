class Project < ActiveRecord::Base

  attr_accessible :name, :description, :img_file, :palettes_attributes
  has_attached_file :img_file, :styles => { :large => "600x600>", :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  
  has_many :palettes, dependent: :destroy
  accepts_nested_attributes_for :palettes

end
