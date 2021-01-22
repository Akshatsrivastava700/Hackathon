class AddRefToChallenge < ActiveRecord::Migration[5.1]
  def change
    add_reference :challenges, :user, foreign_key: true
  end
end
