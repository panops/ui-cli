module PanOps
  module UserInterfaces
    module CLI
      # Various test utilities for the PanOps UI-CLI system. This is not
      # included by default from the global PanOps UI-CLI include (panops/user_interfaces/cli).
      # If you want to have test utilities available you must explicitly require
      # panops/user_interfaces/cli/test_utilities
      module TestUtilities
      end
    end
  end
end

require 'panops/user_interfaces/cli/test_utilities/command_runner'
