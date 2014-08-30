CarrierWave.configure do |config|

  config.fog_directory = ENV['Settings.aws.direct']

  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: ENV['Settings.aws.akey'],
    aws_secret_access_key: ENV['Settings.aws.sakey'],
    region: 'eu-west-1'
  }
end
