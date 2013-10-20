class Tasting < ActiveRecord::Base
  belongs_to :wine
  belongs_to :user
  has_and_belongs_to_many :nose_flavors
  has_and_belongs_to_many :mouth_flavors
  
  validates :wine, :presence => true
  validates :user, :presence => true
  validates :vintage, :presence => true
  validates :note, :presence => true
  
  scope :last, lambda {|count| order("id DESC").limit(count) }
  scope :user, lambda {|user| where('user_id = ?', user.id)}
  scope :users, lambda {|users| where('user_id IN (?)', users)}
  
  def eye?
    note?(eye_intensity) or note?(eye_color) 
  end
  
  def nose?
    note?(nose_intensity) or note?(nose_complexity) or !nose_flavors.empty?
  end
  
  def mouth?
    note?(mouth_acidity) or note?(mouth_bitterness) or note?(mouth_alcohol) or note?(mouth_sweet) or note?(mouth_tanins) or note?(mouth_co2) or note?(mouth_complexity) or note?(mouth_persistence) or !mouth_flavors.empty?
  end
  
  private
  def note?(value)
    !value.nil? and value!=0
  end
end
