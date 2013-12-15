class Estate < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged

  belongs_to :user
  has_many :wines
  has_many :comments, as: :commented
  
  validates :name, :length => { :minimum => 5 }
  
  scope :random, order('random()').limit(5)
  scope :not, lambda {|id| where('id != ?', id)}
  scope :validated, where('validation = ?' , true)
  scope :not_validated, where('validation = ?' , false)
  scope :like, lambda {|name| where("name ILIKE ?", "%#{name}%")}
  scope :on_page, lambda {|page| order('name ASC').page(page).per(10)}
  
  def validated?
    validation
  end
  
  def destroyable?
    Wine.where('estate_id = ?', id).count == 0
  end
  
end
