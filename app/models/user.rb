class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :role, :name
    
  has_many :projects
  has_many :products
  has_many :palettes
  has_many :catalogues
    
  scope :customers, where(role: CUSTOMER)
  scope :artisans, where(role: ARTISAN)
  
  def roles_symbol
    [role.to_sym]
  end
  
  def customer?
    true if self.role == CUSTOMER
  end
  
  def artisan?
    true if self.role == ARTISAN
  end

  def catalog
    Project.where(user_id: self.id, show_in_catalog: true)
  end

  private
  
  def create_catalog
    
  end


end
