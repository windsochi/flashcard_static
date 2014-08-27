CarrierWave.configure do |config|
  config.storage = :fog
  config.fog_directory  = 'fcwindsochi'

  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id 'AKIAJOPEGYOBDBXDUGQQ',
    aws_secret_access_key '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',
    region 'eu-west-1',
  }
end
