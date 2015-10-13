class Keyword < ActiveRecord::Base

  mount_uploader :keys, KeywordsUploader

  validates_format_of :keys, :with => %r{\.(csv)\z}i, :message => "file must have CSV extension"

  validates :name, :description, :keys, presence: true
  validates :name, uniqueness: true

  has_many :statistics, dependent: :delete_all

end
