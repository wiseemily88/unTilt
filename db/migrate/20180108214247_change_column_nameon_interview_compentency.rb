class ChangeColumnNameonInterviewCompentency < ActiveRecord::Migration[5.1]
  def change
    rename_column :interview_competencies, :compentency_id, :competency_id
  end
end
