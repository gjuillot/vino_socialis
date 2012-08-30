class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  acts_as_messageable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me, :locale, :role
  
  default_scope order: 'name ASC'
  
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
  def unread_messages
    mailbox.inbox(:read => false).count(:id, :distinct => true)
  end
end
