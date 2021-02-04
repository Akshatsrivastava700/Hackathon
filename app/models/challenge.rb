class Challenge < ApplicationRecord
  belongs_to :user
  has_many :tag_challenges, dependent: :destroy

  validates_presence_of :title
  validates_presence_of :description
  validates_presence_of :user_id
end
