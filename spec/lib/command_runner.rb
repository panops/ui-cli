# we'll run the commands with the Open3.popen3 command to allow for IO redirection
# and capture
require 'open3'
require 'timeout'

module PanOps
  module UserInterfaces
    module CLI
      module TestUtilities
        module CommandRunner
          
          class Process
            
            def initialize command
              @standard_in, @standard_out, @standard_error, @wait_thread = Open3.popen3(command)
            end
            
            # execute the request in the given block with a timeout
            def with_timeout seconds, &block
              Timeout.timeout(seconds) do
                block.call
              end
            end
            
            # send keyboard input to the process
            # note that you may also send control characters such as 'return' or 'backspace'
            # as the most likely thing you'll want to do is enter commands on the CLI terminal
            # we send enter by default, override the second parameter with '' to prevent this
            # from happening
            def tell string, terminator = '\n'
              @standard_in.write(string+terminator)
              return nil
            end
            
            # read standard output from the process until a given separator is encountered
            def listen_until separator='\n'
              @standard_in.gets separator
            end
            
          end
          
          class Command
            
            attr_reader :command
            
            def initialize command
              @command = command
            end
            
            def self.run command, arguments = []
              self.new(command).run(arguments)
            end
            
            # executes the command with the given arguments
            # @return [Process] the process which encapsulates a particular run of this command
            def run arguments = []
              Process.new([command, arguments].flatten)
            end
            
          end
          
        end
      end
    end
  end
end
