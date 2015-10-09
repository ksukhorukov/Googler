class Keyword < ActiveRecord::Base
  mount_uploader :keys, KeywordsUploader
  store_in_background :keys

  validates :name, :description, :keys, presence: true
  validates :name, uniqueness: true

end
