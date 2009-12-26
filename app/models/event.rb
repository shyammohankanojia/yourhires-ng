class Event < ActiveRecord::Base
	belongs_to :recruitment_step
	has_many :interviewers, :dependent => :destroy
	validates_presence_of :start_time, :end_time

	def in_future?
		self.start_time >= Time.now
	end

	def interviewer_selections=(participant_ids)
		participants = Participant.find_all_by_id(participant_ids)
		participants.each do |participant|
			self.interviewers.build(:participant => participant)
		end
	end

	def interviewer_deselections=(interviewer_ids)
		self.interviewers.delete(Interviewer.find_all_by_id(interviewer_ids))
	end

end