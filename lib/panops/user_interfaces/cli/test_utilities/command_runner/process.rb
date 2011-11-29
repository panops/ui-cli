require 'state_machine'

module PanOps
  module UserInterfaces
    module CLI
      module TestUtilities
        module CommandRunner

          # Represents a spawned command. Has IO Endpoints for communicating
          # with the spawned process.
          # This class contains a state_machine state machine called 'state'.
          # It supports events started and stopped. The event stopped transitions
          # the state machine into the terminated state. The event started transitions
          # the state machine in the running state. The state machine starts in the created
          # state.
          class Process
            
            # Create a new Process instance.
            def initialize
              initialize_state_machines
            end
            
            state_machine :state, :initial => :created do
              
              event :started do
                transition :created => :running
              end
              
              event :stopped do
                transition :running => :terminated
              end
              
            end
            
          end

        end
      end
    end
  end
end
