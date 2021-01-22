class CreateChallenges < ActiveRecord::Migration[5.1]
  def change
    create_table :challenges do |t|
      t.string :title, null: false
      t.text :description, null: false

      t.timestamps
    end
  end
end
