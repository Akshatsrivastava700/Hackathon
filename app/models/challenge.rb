class Challenge < ApplicationRecord
  belongs_to :user
  has_many :tag_challenges, dependent: :destroy
  has_many :votes,  dependent: :destroy
  has_many :collaboration, dependent: :destroy

  validates_presence_of :title
  validates_presence_of :description
  validates_presence_of :user_id

  self.per_page = 2
end
