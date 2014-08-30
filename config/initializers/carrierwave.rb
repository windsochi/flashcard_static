CarrierWave.configure do |config|

  config.fog_directory = AppSettings.s3_direct

  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: AppSettings.s3_key,
    aws_secret_access_key: AppSettings.s3_secret,
    region: 'eu-west-1'
  }
end
