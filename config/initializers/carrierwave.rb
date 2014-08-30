CarrierWave.configure do |config|

  config.fog_directory = AppSettings.S3_DIRECT

  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: AppSettings.S3_KEY,
    aws_secret_access_key: AppSettings.S3_SECRET,
    region: 'eu-west-1'
  }
end
