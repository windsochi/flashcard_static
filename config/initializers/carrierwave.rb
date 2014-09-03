require 'loadconfig'
CarrierWave.configure do |config|

  config.fog_directory =   LoadConfigYml.config['s3_direct']

  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id:     LoadConfigYml.config['s3_key'],
    aws_secret_access_key: LoadConfigYml.config['s3_secret'],
    region:                LoadConfigYml.config['s3_region']
  }
end
