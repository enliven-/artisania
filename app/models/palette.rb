class Palette < ActiveRecord::Base
  # attr_accessible :title, :body
  has_many :attribute_layers

  accepts_nested_attributes_for :attribute_layers

end
