class CreateTagChallenges < ActiveRecord::Migration[5.1]
  def change
    create_table :tag_challenges do |t|
      t.references :tag, foreign_key: true
      t.references :challenge, foreign_key: true

      t.timestamps
    end
  end
end
