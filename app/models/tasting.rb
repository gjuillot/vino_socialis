class Tasting < ActiveRecord::Base
  belongs_to :wine
  belongs_to :user
  
  scope :last, lambda {|count| order('"id DESC"').limit(count) }
end
