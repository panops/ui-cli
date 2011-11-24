module PanOps
  module UserInterfaces
    module CLI

      #Release version for PanOps UI CLI. This versioning scheme adheres
      #to the [semantic versioning specification](http://semver.org).
      module Version

        # The Major Version Number
        MAJOR = '0'
        # The Minor Version Number
        MINOR = '0'
        # The Patch Version Number
        PATCH = '1alpha1'

        # Converts the information stored in the Version module into a standards compliant
        # version identification string
        # @return [String] The standard version string
        def self.to_standard_version_s
          [ MAJOR, MINOR, PATCH ].join '.'
        end

      end

    end
  end
end
