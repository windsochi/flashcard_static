require 'yaml'
module LoadConfigYml
  CONFIG_PATH = File.join(Rails.root, 'config/settings.yml')

  def self.config
    @_config ||= YAML.load(ERB.new(File.read(CONFIG_PATH)).result)[Rails.env]
  end
end
