class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  acts_as_messageable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me, :locale, :role, :tutorial
  
  default_scope order: 'name ASC'
  
  has_many :bottles
  
  ROLES = %w[admin moderator user]
  
  def admin?
    role == 'admin'
  end
  
  def moderator?
    admin? || (role == 'moderator')
  end
  
  before_create :set_defaults
  
  private
  def set_defaults
    if self.role.nil?
      self.role = 'user'
    end
    if self.locale.nil?
      self.locale = I18n.locale
    end
  end

  def mailboxer_name
    name
  end

  def mailboxer_email
    email
  end
  
  public
  def remaining_bottles
    bottles.where('remaining_quantity > 0')
  end
  
  public
  def unread_messages
    mailbox.inbox(:read => false).count(:id, :distinct => true)
  end
  
  def sim_euclide_bottles(other)
    if self.remaining_bottles.empty? || other.remaining_bottles.empty?
      return 0
    end
    
    sum_of_squares = 0
    self.remaining_bottles.each do |self_b|
      distances = other.remaining_bottles.map {|other_b| self_b.dist_euclide(other_b)}
      sum_of_squares += distances.min**2
    end
    other.remaining_bottles.each do |other_b|
      distances = self.remaining_bottles.map {|self_b| other_b.dist_euclide(self_b)}
      sum_of_squares += distances.min**2
    end
    (5 / (1 + Math.sqrt(sum_of_squares))).round(2)
  end
end
