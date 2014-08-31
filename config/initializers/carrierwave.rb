require 'aws'
CarrierWave.configure do |config|

  config.fog_directory = aws.config['directory']

  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: aws.config['access_key_id'],
    aws_secret_access_key: aws.config['secret_access_key'],
    region: aws.config['region']
  }
end
