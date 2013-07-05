class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :trackable, :validatable, :recoverable
         
  acts_as_messageable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me, :locale, :role, :tutorial, :date_format, :currency
  
  default_scope order: 'name ASC'
  
  has_many :bottles
  has_many :consumptions
  
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
  
  def bottles_distance(other)
    common_estates = ( (self.remaining_bottles.map {|b| b.wine.estate.id}) & (other.remaining_bottles.map {|b| b.wine.estate.id})).size
    distances = self.remaining_bottles.product(other.remaining_bottles).map {|b1, b2| b1.distance(b2)}
    return (0.8 ** common_estates) * (distances.sum.to_f / distances.size)
  end
  
  def books
    Book.joins(:libraries).where("libraries.user_id = ?", self.id)
  end
  
  def own_book?(book)
    not Library.where('book_id = ? AND user_id = ?', book.id, self.id).empty?
  end
end
