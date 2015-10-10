class Word < ActiveRecord::Base
  has_one :cache, dependent: :destroy
  belongs_to :keyword
end
