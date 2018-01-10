class InterviewsController < ApplicationController

  def index
    @interviews = Interview.open

  end

  def edit
    @interview = Interview.find(params[:id])
    competency = @interview.competencies.build
    competency.interview_competencies.build
  end

  def update
    interview = Interview.find(params[:id])
    interview.update(interview_params)
    interview.status = 1
    interview.interview_competencies.update(score_params)
    flash[:success] = "Thanks for completing the interview!"
    redirect_to interviews_path

  end

 private
    def interview_params
      params.require(:interview).permit(:score, :comment)
    end

    def score_params
      params.require(:interview).permit(:interview_competencies_attributes)
    end
end
