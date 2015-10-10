class Statistic < ActiveRecord::Base
  belongs_to :keyword
  has_one :cache
end
