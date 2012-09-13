class Estate < ActiveRecord::Base
  belongs_to :user
  has_many :wines
  
  validates :name, :length => { :minimum => 5 }
  
  def validated?
    validation
  end
end
