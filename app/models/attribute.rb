class Attribute < ActiveRecord::Base

  attr_accessible :name, :attribute_layer

  belongs_to :attribute_layer

end
