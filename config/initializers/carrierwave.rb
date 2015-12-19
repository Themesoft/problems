if Rails.env.production?
  bucket = 'problembankimages'
else
  bucket = 'problembankimagesdev'
end

CarrierWave.configure do |config|
  config.fog_credentials = {
    provider:              'AWS',                                 # required
    aws_access_key_id:     ENV['AWS_PROBLEM_KEY_ID'],             # required
    aws_secret_access_key: ENV['AWS_PROBLEM_SECRET_ACCESS_KEY'],  # required
    region:                'us-east-1',                  # optional, defaults to 'us-east-1'
    host:                  's3.example.com',             # optional, defaults to nil
    endpoint:              'https://s3.amazonaws.com' # optional, defaults to nil
  }
  config.fog_directory  = ENV['AWS_PROBLEM_BUCKET']
  config.fog_public     = false
end
