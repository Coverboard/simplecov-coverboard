require "erb"
require "cgi"
require "fileutils"
require "digest/sha1"
require "time"

# Ensure we are using a compatible version of SimpleCov
major, minor, patch = SimpleCov::VERSION.scan(/\d+/).first(3).map(&:to_i)
if major < 0 || minor < 9 || patch < 0
  fail "The version of SimpleCov you are using is too old. "\
  "Please update with `gem install simplecov` or `bundle update simplecov`"
end

module SimpleCov
  module Formatter
    class CoverBoardFormatter
      DOT_FILE = '.coverboard.yml'

      def initialize
        @uid = load_from_config
      end

      def format(result)
        send_to_api(create_message(metrics(result)))
      end

      private
        # michal says: LATERRRRR
        PRECISSION = 2
        TIMESTAMP = Time.now.getutc

        def metrics(numbers)
          prefix = 'coverage-'

          metrics = Hash.new
          numbers.groups.each do |key, value|
            key = prefix + key.gsub(' ','-').downcase
            metrics[key] = value.covered_percent.round(PRECISSION)
          end
          metrics[prefix.gsub('-','')] = numbers.source_files.covered_percent.round(PRECISSION)
          metrics
        end

        def create_message metrics
          app_message = ApplicationMessage.new
          app_message.uid = @uid
          app_message.ts = TIMESTAMP
          app_message.metrics = metrics
          return app_message.to_json
        end

        def send_to_api msg
          connector = Connector.new
          puts connector.post msg
        end

      private
        def load_from_config
          config = YAML.load(File.read("#{Dir.pwd}/#{DOT_FILE}"))
          @uid = config['coverboard']['uid']
        end
    end
  end
end

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__)))
require "simplecov-coverboard/version"

require "api/config"
require "api/application_message"
require "api/connector"
