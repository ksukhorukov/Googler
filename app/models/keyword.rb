class Keyword < ActiveRecord::Base

  mount_uploader :keys, KeywordsUploader

  validates_format_of :keys, :with => %r{\.(csv)\z}i, :message => "file must have CSV extension"

  validates :name, :description, :keys, presence: true
  validates :name, uniqueness: true

  has_many :statistics, dependent: :delete_all

  validates_presence_of :user_id
  validates_presence_of :keys

end
