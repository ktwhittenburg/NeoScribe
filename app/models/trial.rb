class Trial < ApplicationRecord
  belongs_to :project
  has_many :behavior, dependent: :destroy
  default_scope -> { order(created_at: :desc) }
  validates :project_id, presence: true
  validates :title, presence: true, length: { maximum: 50}
  validates :synopsis, length: { maximum: 144}
  validates :temp, length: { maximum: 50}
  validates :location, length: { maximum: 144}
end
