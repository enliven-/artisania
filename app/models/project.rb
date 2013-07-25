class Project < ActiveRecord::Base

  attr_accessible :name, :description, :img_file, :product_category_id,
                  :show_in_catalog, :palettes_attributes, :customer_id
  has_attached_file :img_file, :styles => { :large => "600x600>", :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  
  validates :name, :presence  => true

  has_many :palettes, dependent: :destroy
  accepts_nested_attributes_for :palettes
  
  belongs_to :user
  belongs_to :product_category
  
  
  def customer
    user_id = self.customer_id
    if user_id
      User.find(user_id).email
    else
      " -- "
    end
  end


  def design_versions
    DesignVersion.where(project_id: self.id)
  end

end
