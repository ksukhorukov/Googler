class Statistic < ActiveRecord::Base
  belongs_to :keyword
  belongs_to :user
  has_one :cache
end
