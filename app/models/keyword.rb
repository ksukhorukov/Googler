class Keyword < ActiveRecord::Base
  mount_uploader :keys, KeywordsUploader

  validates :name, :description, :keys, presence: true
  validates :name, uniqueness: true

end
