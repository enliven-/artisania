class DesignVersion < ActiveRecord::Base
  attr_accessible :design_html, :project_id

  belongs_to :project, :counter_cache => true
end