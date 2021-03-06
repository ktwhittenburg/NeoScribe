class Project < ApplicationRecord
  has_many :trials, dependent: :destroy
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :title, presence: true, length: { maximum: 50}
  validates :synopsis, length: { maximum: 144}
end
