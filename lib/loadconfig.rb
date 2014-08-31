require 'yaml'
module LoadConfigYml
  CONFIG_PATH = File.join(Rails.root, 'config/settings.yml')

  def self.config
    @_config ||= YAML.load_file(CONFIG_PATH)[Rails.env]
  end
end
