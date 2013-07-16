class Project < ActiveRecord::Base

  attr_accessible :name, :description, :img_file, :product_category_id,
                  :show_in_catalog, :palettes_attributes, :customer_id
  has_attached_file :img_file, :styles => { :large => "600x600>", :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  
  validates :name, :presence  => true

  has_many :palettes, dependent: :destroy
  accepts_nested_attributes_for :palettes
  
  belongs_to :user
  belongs_to :product_category
  
  
  # def duplicate
  #   self.class.create(
  #     name: name,
  #     description: description,
  #     user_id: user_id,
  #     design_versions_count: design_versions_count,
  #     img_file_file_name: img_file_file_name,
  #     img_file_content_type: img_file_content_type,
  #     img_file_file_size: img_file_file_size,
  #     img_file_updated_at: img_file_updated_at,
  #     product_category_id: product_category_id
  #   ).tap do |clone|
  #     clone.palettes = self.palettes
  #     clone.save
  #   end
  # end
  
  def customer
    user_id = self.customer_id
    if user_id
      User.find(user_id).email
    else
      "No one currently"
    end
  end

end
