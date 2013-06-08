class Project < ActiveRecord::Base
  # attr_accessible :title, :body
  has_one :palette

  accepts_nested_attributes_for :palettes

end
