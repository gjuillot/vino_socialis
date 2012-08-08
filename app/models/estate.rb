class Estate < ActiveRecord::Base
  belongs_to :user
  
  def validated?
    validation
  end  
end
