class InterviewsController < ApplicationController

  def index
    @interviews = Interview.open

  end

  def edit
    @interview = Interview.find(params[:id])
  end

  def update
    interview = Interview.find(params[:id])
    interview.update(interview_params)
    flash[:success] = "Thanks for completing the interview!"
    redirect_to interviews_path
  end

 private
    def interview_params
      params.require(:interview).permit(:score, :comment)
    end
end
