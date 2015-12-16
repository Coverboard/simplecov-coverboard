require 'yaml'

module CoverBoard
  class Config
    DOT_FILE = '.coverboard.yml'

    @@config = nil

    HTTPS = true
    HOST = 'aqueous-forest-2696.herokuapp.com'
    PORT = 80
    ENDPOINT = '/api/metrics'

    def self.uid
      from_yml 'uid'
    end

    def self.user
      from_yml 'user'
    end

    def self.password
      from_yml 'password'
    end

    def self.host
      from_yml 'host', HOST
    end

    def self.port
      from_yml 'port', PORT
    end

    def self.endpoint
      from_yml 'endpoint', ENDPOINT
    end

    def self.verbose
      from_yml 'verbose', false
    end

    def self.https
      from_yml 'https', HTTPS
    end

    private
      def self.from_yml(key, default='')
        if @@config.nil?
          path = "#{Dir.pwd}/#{DOT_FILE}"
          if File.exists? path
            @@config = YAML.load(File.read(path))
          end
        end
        return default if @@config.nil? || @@config['coverboard'][key].nil?
        @@config['coverboard'][key]
      end
  end
end
