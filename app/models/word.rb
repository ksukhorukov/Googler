class Word < ActiveRecord::Base
  has_one :cache, dependent: :destroy
  belongs_to :keywords, foreign_key: :keywords_id
end
