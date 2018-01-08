class CreateInterviewCompentenciesTable < ActiveRecord::Migration[5.1]
  def change
    create_table :interview_compentencies do |t|
      t.references :interview, foreign_key: true
      t.references :compentency, foreign_key: true
    end
  end
end
