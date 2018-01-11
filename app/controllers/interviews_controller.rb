class InterviewsController < ApplicationController

  def index
    @interviews = current_user.interviews.open

  end

  def edit
    @interview = Interview.find(params[:id])
    competency = @interview.competencies.build
    competency.interview_competencies.build
    @interview.interview_questions.build
    @questions = Question.all.map{ |u| [ u.question, u.id ] }
  end

  def update
    interview = Interview.find(params[:id])
    interview.update(interview_params)
    interview.status = 1

    score_params[:interview_competencies_attributes].each do |interview_competency|
      interview_score = InterviewCompetency.find(score_params[:interview_competencies_attributes][interview_competency][:id])
      interview_score.competency_score = score_params[:interview_competencies_attributes][interview_competency][:competency_score]
    end

    flash[:success] = "Thanks for completing the interview!"

    redirect_to interviews_path

  end

 private
    def interview_params
      params.require(:interview).permit(:score, :comment)
    end

    def score_params
      params.require(:interview).permit(interview_competencies_attributes: [:competency_score, :id])
    end
end
