class InterviewsController < ApplicationController

  def index
    @interviews = Interview.all 
  end
end
