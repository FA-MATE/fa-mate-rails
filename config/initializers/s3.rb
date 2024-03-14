# require 'aws-sdk-s3'
# 
# begin
#   if Rails.env.test?
#     Aws.config.update(
#     region: 'ap-east-1',
#     credentials: Aws::Credentials.new('minio_root_user', 'minio_root_password')
#   )
# 
#     Aws.config[:s3] = {
#       endpoint: 'http://127.0.0.1:9000',
#       force_path_style: true,
#       stub_responses: false,
#     }
#   end
# rescue e
#   puts e
# end