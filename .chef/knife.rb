log_level                :info
log_location             STDOUT
node_name                'chef-client'
client_key               './chef-client.pem'
validation_client_name   'chef-validator'
validation_key           './.chef/validation.pem'
chef_server_url          'http://54.214.2.155:4000'
syntax_check_cache_path  './syntax_check_cache'
cookbook_path [ './cookbooks' ]
