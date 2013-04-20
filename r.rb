require 'json'
new_artifact_name = ARGV[0]
data_bag = `knife data bag show apps application_artifacts -f json`
data_bag_json = JSON.parse(data_bag)
url_text = data_bag_json["sampleApp"]["QA"]["artifact"]
old_artifact_name = url_text.split('/').last
updated_artifact_name = url_text.gsub!(old_artifact_name, new_artifact_name)
data_bag_json["sampleApp"]["QA"]["artifact"] = updated_artifact_name
File.open('data_bags/apps/application_artifacts.json','w+') {|f| f.write(data_bag_json)}
'knife data bag upload from file apps application_artifacts.json'