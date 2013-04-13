app_artifact = data_bag_item("artifacts", "application_artifacts")

deploy_artifact_url = app_artifact["sampleApp"]["UAT"]["artifact"]
app_deploy_location = node["default"]["app_deploy_location"]

# ["/opt/apps", app_deploy_location].each do |dir|
# 	directory dir do
# 		owner "root"
# 		group "root"
# 		mode 0755
# 		action :create
# 	end
# end

execute "cleanup" do
	command "rm -rf #{app_deploy_location}/sample*"
end

remote_file "sample" do
	path "#{app_deploy_location}/sample.war"
	source deploy_artifact_url
	mode "0644"
	owner "root"
end
