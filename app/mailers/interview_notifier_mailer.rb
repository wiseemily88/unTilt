class InterviewNotifierMailer < ApplicationMailer

  def inform(user, interview, interviewer)

    @user = user
    @interview = interview
    mail(to: interviewer, subject: "#{user.first_name} has a new interview scheduled.")

  end
end
