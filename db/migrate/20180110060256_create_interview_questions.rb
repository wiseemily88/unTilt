class CreateInterviewQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :interview_questions do |t|
      t.references :interview, foreign_key: true
      t.references :question, foreign_key: true
      t.text :candidate_response

      t.timestamps
    end
  end
end
