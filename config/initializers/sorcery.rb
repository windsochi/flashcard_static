require 'loadconfig'
Rails.application.config.sorcery.submodules = [:external]

Rails.application.config.sorcery.configure do |config|
  config.user_class = "User"
  config.external_providers = [:github]
  config.github.key =          LoadConfigYml.config['github_key']
  config.github.secret =       LoadConfigYml.config['github_secret']
  config.github.callback_url = LoadConfigYml.config['github_callback']
  config.github.user_info_mapping = {:email => "name"}

  config.user_config do |user|
    user.authentications_class = Authentication
  end
end
