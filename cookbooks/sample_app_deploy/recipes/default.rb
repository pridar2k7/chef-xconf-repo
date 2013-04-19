app_artifact = data_bag_item("apps", "application_artifacts")
deploy_artifact_url = app_artifact["sampleApp"]["QA"]["artifact"]
app_deploy_location = node["sample_app_deploy"]["app_deploy_location"]

artifact_name = File.basename(deploy_artifact_url)


if (!File.exists?("#{app_deploy_location}/#{artifact_name}"))
	execute "cleanup" do
		command "rm -rf #{app_deploy_location}/sample*"
	end
	
	remote_file artifact_name do
		path "#{app_deploy_location}/#{artifact_name}"
		source deploy_artifact_url
		mode "0644"
		owner "root"
	end
	
	execute "sym_link" do
		command "sudo ln -s #{app_deploy_location}/#{artifact_name} /var/lib/tomcat6/webapps/samples.war"	
	end
end

cron "chef_client run" do
  minute "30"
  user "ubuntu"
  command "sudo chef-client"
  only_if { node['run_chef_as_cron'] == 'true'}

end