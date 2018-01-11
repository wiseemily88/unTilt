class InterviewUpdateService

def update_joins_table
  score_params[:interview_competencies_attributes].each do |interview_competency|
    interview_score = InterviewCompetency.find(score_params[:interview_competencies_attributes][interview_competency][:id])
    interview_score.competency_score = score_params[:interview_competencies_attributes][interview_competency][:competency_score]
  end
end
