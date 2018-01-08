class RenameInterviewCompentenciesToInterviewCompetencies < ActiveRecord::Migration[5.1]
  def change
    rename_table :interview_compentencies, :interview_competencies
  end
end
