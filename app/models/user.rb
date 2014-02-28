class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :trackable, :validatable, :recoverable
  before_save :ensure_authentication_token
         
  acts_as_messageable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me, :locale, :role, :tutorial, :date_format, :currency
  
  default_scope order: 'name ASC'
  
  has_many :bottles
  has_many :consumptions

  has_many :relationships, foreign_key: "follower_id", dependent: :destroy
  has_many :followed_users, through: :relationships, source: :followed
  has_many :reverse_relationships, foreign_key: "followed_id", class_name:  "Relationship", dependent:   :destroy
  has_many :followers, through: :reverse_relationships, source: :follower
  
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
  
  # https://gist.github.com/josevalim/fb706b1e933ef01e4fb6
  def ensure_authentication_token
    if authentication_token.blank?
      self.authentication_token = generate_authentication_token
    end
  end
   
  private
  def generate_authentication_token
    loop do
      token = Devise.friendly_token
      break token unless User.where(authentication_token: token).first
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
  
  def following?(other_user)
    not relationships.where('followed_id = ?', other_user.id).empty?
  end

  def follow!(other_user)
    relationships.create!(followed_id: other_user.id)
  end
  
  def unfollow!(other_user)
    relationships.where('followed_id = ?', other_user.id).delete_all
  end
end
