module FeedbacksHelper
	
	def select_interviewer_options(candidate)
		candidate.interviewers.collect do |interviewer|
			["#{interviewer.name} in #{interviewer.event.recruitment_step.name}", interviewer.id]
		end
	end
end