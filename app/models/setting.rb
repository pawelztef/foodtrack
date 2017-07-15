class Setting < ActiveRecord::Base
 mount_uploader :image, LogoUploader
  
 def smtp_username
   Settings.reload!
   Settings.smtp_username
 end
 def smtp_username=(new_username)
   write_to_file('smtp_username', new_username)
 end

 def smtp_pass
   Settings.reload!
   Settings.smtp_pass
 end
 def smtp_pass=(new_pass)
   write_to_file('smtp_pass', new_pass)
   Settings.reload!
 end

 def instagram_id
   Settings.reload!
   Settings.instagram_id
 end
 def instagram_id=(new_id)
   write_to_file('instagram_id', new_id)
 end

 def instagram_secret
   Settings.reload!
   Settings.instagram_secret
 end
 def instagram_secret=(new_secret)
   write_to_file('instagram_secret', new_secret)
 end

 def instagram_token
   Settings.reload!
   Settings.instagram_token
 end
 def instagram_token=(new_token)
   write_to_file('instagram_token', new_token)
 end

 def maps_api_key
   Settings.reload!
   Settings.maps_api_key
 end
 def maps_api_key=(new_api)
   write_to_file('maps_api_key', new_api)
 end
 
 def facebook_app_id
   Settings.reload!
   Settings.facebook_app_id
 end
 def facebook_app_id=(new_id)
   write_to_file('facebook_app_id', new_id)
 end

 def facebook_secret
   Settings.reload!
   Settings.facebook_secret
 end
 def facebook_secret=(new_secret)
   write_to_file('facebook_secret', new_secret)
 end

 private 
 def write_to_file(key, value)
    config = YAML.load_file(Rails.root.join('config/settings.yml'))
    config[key] = value 
    File.open(Rails.root.join('config/settings.yml'), 'w') { |f| f.write config.to_yaml }
    Settings.reload!
 end
end
