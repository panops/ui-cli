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
      
      it "is initially in state created" do
        subject.state_name.should eql(:created)
      end
      
      context 'for state' do
        
        context 'created' do
          
          it "defines that state" do
            @state_state_machine_states.should include(:created)
          end
          
        end
        
        context 'running' do
        
          it "defines that state" do
            @state_state_machine_states.should include(:running)
          end
          
        end
        
        context 'terminated' do
        
          it "defines that state" do
            @state_state_machine_states.should include(:terminated)
          end
          
        end
        
      end
      
      context 'on event' do
        
        before :each do
          @state_state_machine_events = @state_state_machine.events
          @state_state_machines_event_names = @state_state_machine_events.map{|e| e.name}
        end
        
        context 'started' do
          
          it 'defines that event' do
            @state_state_machines_event_names.should include(:started)
          end
          
          context 'when the state state machine is in the created state' do
            
            before :each do
              subject.state = 'created'
            end
            
            context 'when the event is fired' do
            
              before :each do
                subject.started
              end
              
              it 'transitions the state machine to the running state' do
                subject.state_name.should eql(:running)
              end
            
            end
            
          end
          
        end
        
      end
      
    end
    
  end
  
end
