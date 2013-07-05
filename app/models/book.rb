class Book < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged
  
  belongs_to :user
  has_many :libraries
  
  validates :title, :length => { :minimum => 5 }
  validates :authors, :length => { :minimum => 5 }
  validates :editor, :length => { :minimum => 5 }
  validates :pages, :numericality => { :greater_than_or_equal_to => 10 }
  validates :isbn, :length => { :minimum => 10 }
  
  scope :validated, where('validation = ?' , true)
  scope :not_validated, where('validation = ?' , false)
  
  def validated?
    validation
  end
end
