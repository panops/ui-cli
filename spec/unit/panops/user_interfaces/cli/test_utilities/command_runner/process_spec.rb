require 'unit/unit_helper'

describe PanOps::UserInterfaces::CLI::TestUtilities::CommandRunner::Process do
  
  it 'is defined' do
    subject.class.should be_eql(PanOps::UserInterfaces::CLI::TestUtilities::CommandRunner::Process)
  end
  
  context 'an instance' do
    
    context 'a state machine called state' do
      
      before :each do
        @state_state_machine = subject.class.state_machines[:state]
        @state_state_machine_states = @state_state_machine.states.map{|s| s.name}
      end
      
      it 'is defined' do
        @state_state_machine.should_not be_nil
      end
      
      it "is initially in state 'created'" do
        subject.state_name.should eql(:created)
      end
      
      context "for state 'created'" do
        
        it "defines that state" do
          @state_state_machine_states.should include(:created)
        end
        
      end
      
      context "for state 'running'" do
      
        it "defines that state" do
          @state_state_machine_states.should include(:running)
        end
        
      end
      
      context "for state 'terminated'" do
      
        it "defines that state" do
          @state_state_machine_states.should include(:terminated)
        end
        
      end
      
    end
    
  end
  
end
