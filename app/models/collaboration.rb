class Collaboration < ApplicationRecord
  belongs_to :challenge
  belongs_to :user
end
