current_dir = File.dirname(__FILE__)
demo_valid = ENV['OPSCODEID']
demo_node = ENV['OPSCODENODE']
log_level                :info
log_location             STDOUT
#node_name                "#{demo_node}"
node_name                "john"
client_key               "#{current_dir}/#{demo_node}.pem"
validation_client_name   "#{demo_valid}-validator"
validation_key           "#{current_dir}/#{demo_valid}-validator.pem"
chef_server_url          "https://api.opscode.com/organizations/#{demo_valid}"
cache_type               'BasicFile'
cache_options( :path => "#{ENV['HOME']}/.chef/checksums" )
cookbook_path            ["#{current_dir}/../cookbooks"]

knife[:aws_access_key_id] = ENV['AWS_ACCESS_KEY_ID']
knife[:aws_secret_access_key] = ENV['AWS_SECRET_ACCESS_KEY']

knife[:rackspace_api_username] = ENV['RS_API_USERNAME']
knife[:rackspace_api_key] = ENV['RS_API_KEY']


