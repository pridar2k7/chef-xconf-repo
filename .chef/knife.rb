log_level                :info
log_location             STDOUT
node_name                'chef-client'
client_key               '/home/ubuntu/.chef/chef-client.pem'
validation_client_name   'chef-validator'
validation_key           '/home/ubuntu/.chef/validation.pem'
chef_server_url          'http://54.214.2.155:4000'
cache_type               'BasicFile'
cache_options( :path => '/home/ubuntu/.chef/checksums' )
