class DesignVersion < ActiveRecord::Base
  attr_accessible :design_html

  belongs_to :project, :counter_cache => true
end