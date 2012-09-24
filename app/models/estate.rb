class Estate < ActiveRecord::Base
  belongs_to :user
  has_many :wines
  
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
  
end
