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
            
            # The executable file's path on the underlying filesystem.
            attr_accessor :executable_path
            
            # A set of arguments which will be passed to the called executable.
            attr_accessor :arguments
            
            # The ID of the running process. This process ID is assigned by the underlying operating system.
            attr_accessor :process_id
            
            # Create a new Process instance to manage a given executable, it's input and output, and state.
            # @param [String] executable_path The path to the executable to be managed by this process object
            # @param [Array[String]] arguments The command-line arguments to pass to the executable.
            # @return [Process] An instance of class Process
            # @example Create a new Process instance
            #   Process.new('/bin/dd', ['if=/dev/zero','of=/dev/null'])
            def initialize executable_path, arguments = []
              @executable_path = executable_path
              @arguments = arguments
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
