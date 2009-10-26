require 'spec_helper'

describe RecruitmentStep do

  it "should know assigned candidate and recruitment step type" do
    candidate = CandidateFactory.create
    recruitment_step_type = RecruitmentStepType.create
    recruitment_step = RecruitmentStep.create!(:recruitment_step_type => recruitment_step_type, :candidate => candidate)

    recruitment_step.candidate.should eql(candidate)
    recruitment_step.recruitment_step_type.should eql(recruitment_step_type)
  end

  it "should be completed when it has an event in past" do
    recruitment_step = RecruitmentStep.create!(:recruitment_step_type => RecruitmentStepType.create, :event => EventFactory.create_in_past)
    recruitment_step.should be_completed
  end

  it "should be upcoming when it has an event in future" do
    recruitment_step = RecruitmentStep.create!(:recruitment_step_type => RecruitmentStepType.create, :event => EventFactory.create_in_future)
    recruitment_step.should be_upcoming
  end
  
  it "should be scheduled if it has an event" do
    recruitment_step = RecruitmentStep.create!(:recruitment_step_type => RecruitmentStepType.create, :event => EventFactory.create_in_future)
    recruitment_step.should be_scheduled    
  end

  it "should be pending when it does not have an event" do
    recruitment_step = RecruitmentStep.create!(:recruitment_step_type => RecruitmentStepType.create, :event => nil)
    recruitment_step.should be_pending
  end

  it "should be pending when it has an event in future" do
    recruitment_step = RecruitmentStep.create!(:recruitment_step_type => RecruitmentStepType.create, :event => EventFactory.create_in_future)
    recruitment_step.should be_pending
  end
  
end
