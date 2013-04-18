name "APP"
description "Sample app"

default_attributes(
  :sample_app_deploy =>{
    :app_deploy_location => "/var/lib/tomcat6/webapps"
  }
)

override_attributes()
run_list(
  "recipe[java]",
    "recipe[tomcat]",
    "recipe[sample_app_deploy]"
  )

