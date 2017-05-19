class Behavior < ApplicationRecord
  belongs_to :trial
  validates :trial_id, presence: true
  validates :name, presence: true, length: { maximum: 50}
end