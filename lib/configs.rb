# encoding: utf-8
require 'yaml'

# Returns preset configs
class Config
  class << self
    def [](key)
      load unless @configs
      @configs[key]
    end

    def load
      return @configs if @configs

      @configs = env_config
    end

    def env_config
      configs = File.expand_path('../../configs/portal.yml', __FILE__)

      raise LoadError.new "#{configs} is missing." unless FileTest.exists?(configs)
      YAML.load(File.read(configs))
    end
  end
end
