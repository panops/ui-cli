require 'state_machine'

module PanOps
  module UserInterfaces
    module CLI
      module TestUtilities
        module CommandRunner

          # Represents a spawned command. Has IO Endpoints for communicating
          # with the spawned process.
          class Process
            
            def initialize
              initialize_state_machines
            end
            
            state_machine :state, :initial => :created do
              
              state :running
              
              state :terminated
              
            end
            
          end

        end
      end
    end
  end
end
