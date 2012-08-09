class Estate < ActiveRecord::Base
  belongs_to :user
  has_many :wines
  
  def validated?
    validation
  end
end
