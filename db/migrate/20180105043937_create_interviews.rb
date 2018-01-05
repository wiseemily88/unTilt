class CreateInterviews < ActiveRecord::Migration[5.1]
  def change
    create_table :interviews do |t|
      t.date :date
      t.integer :score
      t.integer :status, default: 0
      t.references :user, foreign_key: true
      t.references :candidate, foreign_key: true

      t.timestamps
    end
  end
end
