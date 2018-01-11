class Seed
  def self.run
    new.run
  end

  def run
    generate_interviewers
    generate_candidates
    generate_competencies
    generate_questions
    generate_interviews
    generate_interview_competencies
    generate_interview_questions
  end

  def generate_interviewers
    20.times do |i|
      user = User.create!(
        first_name:  Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        email:    Faker::Internet.safe_email,
        password: "password",
        job_title: Faker::Job.title,
        department:  Faker::Job.field,
        role: 0,
        gender: Faker::Number.between(0, 4),
        race: Faker::Number.between(0, 4),
        education_level: Faker::Number.between(0, 4)
        )
      puts "User #{i}: #{user.first_name} created!"
    end
  end

  def generate_candidates
    20.times do |i|
      candidate = Candidate.create!(
        first_name:  Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        target_role: Faker::Job.title
        )
      puts "Item #{i}: #{candidate.first_name} created!"
    end
  end

  def generate_competencies
    Competency.create!(name: "Integrity", description: "Shares complete and accurate information. Maintains confidentiality and  meets own commitments.")
    Competency.create!(name: "Initiative", description: "Generates ideas for improvement, takes advantage of opportunities, suggests innovations. Does more than required.")
    Competency.create!(name: "Communication", description: "Expresses ideas effectively. Organizes and delivers information appropriately. Listens actively.")
    Competency.create!(name: "Problem Solving", description: "Analyzes problem by gathering and organizing all relevant information. Comes up with appropriate solutions. Identifies cause and effect relationships.")
    Competency.create!(name: "Teamwork", description: "Interacts with people effectively. Able and willing to share and receive information.")
    Competency.create!(name: "Decision Making", description: "Considers all pertinent facts and alternatives before deciding on the most appropriate action.")
    Competency.create!(name: "Reliability", description: "Takes personal responsibility for job performance. Completes work in a timely and consistent manner.")
    Competency.create!(name: "Adaptability", description: "Adapts to changing work environments, work priorities and organizational needs.")
  end

  def generate_questions
    Question.create!(question: "Describe a difficult experience at work and how you handled it.", competency_id: 2)
    Question.create!(question: "Describe a time when you spoke up even though it was unpopular.", competency_id: 1)
    Question.create!(question: "How do you earn the trust of others?", competency_id: 1)
    Question.create!(question: "Describe a time when you admitted a mistake to a co-worker.", competency_id: 1)
    Question.create!(question: "Describe a major change that occurred in a job that you held. How did you adapt to this change?", competency_id: 8)
    Question.create!(question: "What do you do when priorities change quickly?", competency_id: 8)
    Question.create!(question: "Describe a situation when you were able to strengthen a relationship by communicating effectively. What made your communication effective?", competency_id: 3)
    Question.create!(question: "Describe a time when you were able to effectively communicate a difficult or unpleasant idea to a superior", competency_id: 3)
    Question.create!(question: "When was the last time something came up in a meeting that was not covered in the plan?", competency_id: 4)
    Question.create!(question: "Have you ever been caught unaware by a problem or obstacles that you had not foreseen? What happened?", competency_id: 4)
    Question.create!(question: "Describe a team experience you found disappointing.", competency_id: 5)
    Question.create!(question: "Describe your leadership style and give an example of a situation when you successfully led a group.", competency_id: 5)
    Question.create!(question: "Tell us about a time that you had to work on a team that did not get along.", competency_id: 5)
    Question.create!(question: "Discuss an important decision you have made regarding a task or project at work.", competency_id: 6)
    Question.create!(question: "How did you go about deciding what strategy to employ when dealing with a difficult customer?", competency_id: 6)
    Question.create!(question: "Describe your ideal work situation.", competency_id: 7)
    Question.create!(question: "Why do you want this job?", competency_id: 7)
  end


  def generate_interviews
    30.times do |i|
      interview = Interview.create!(
        date:  Faker::Date.forward(60),
        score: Faker::Number.between(1, 5),
        comment: Faker::SiliconValley.quote,
        user_id: Faker::Number.between(1, 20),
        status: Faker::Number.between(0, 1),
        candidate_id: Faker::Number.between(1, 20)
        )
      puts "Item #{i}: #{interview.date} created!"
    end
  end


  def generate_interview_competencies
    90.times do |i|
      interview_competencies = InterviewCompetency.create!(
        interview_id:  Faker::Number.between(1, 30),
        competency_id: Faker::Number.between(1, 8),
        competency_score: Faker::Number.between(1, 5)
        )
      puts "Item #{i}: #{interview_competencies} created!"
    end
  end

  def generate_interview_questions
    90.times do |i|
      interview_questions = InterviewQuestion.create!(
        interview_id:  Faker::Number.between(1, 30),
        question_id: Faker::Number.between(1, 17),
        candidate_response: Faker::Movie.quote
        )
      puts "Item #{i}: #{interview_questions} created!"
    end
  end
end

Seed.run
