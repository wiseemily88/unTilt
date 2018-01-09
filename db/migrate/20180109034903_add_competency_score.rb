class AddCompetencyScore < ActiveRecord::Migration[5.1]
  def change
    add_column :interview_competencies, :competency_score, :integer
  end
end
