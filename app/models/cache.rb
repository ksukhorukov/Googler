class Cache < ActiveRecord::Base
  belongs_to :statistic
  validates_presence_of :statistic_id
  validates_presence_of :cache
end
