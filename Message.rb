# RTask 1

# Design a ruby class, an object of which has the behaviour of accept the following hash and constructs an ruby object like following mapping

# Atributes                   data from the input hash
# ====================        =============================
# user_id                     user_id
# message                     allert_message/allert_message + “batch_count” if silent is true/false
# message_type                notification_type
# pop_up                      silent
# publish_at                  effective_date
# target                      ‘gcm’/’apn’ if device is android/ios
# device_ids                  tokens_from_the_ios_or_android_key

# Sample data hash 1
# =======================================
# {
#   "properties": {
#     "user_id":43,
#     "managing_user_id":43,
#     "description":"Push Notification",
#     "effective_date":"2015-07-20T06:28:36-05:00",
#     "system_date":"2015-07-20T06:28:36-05:00"
#   },
#   "payload":{
#     "id": 49,
#     "options": {
#       "devices": "ios => e25454608b6097bc412be42ad9bf39797a698925d947b9d136cbb992f649cc96",
#       "alert_message": " You have following notifications ",
#       "badge_count":10,
#       "created_at":"2015-07-20T06:28:36-05:00",
#       "id":48,
#       "member_id":25,
#       "notification_type": "secure_message",
#       "silent":true,
#       "updated_at":"2015-07-20T06:28:36-05:00"
#     }
#   }
# }

# Sample data hash 2
# =======================================================
# {
#   "properties": {
#     "user_id": 43,
#     "managing_user_id": 43,
#     "description": "Push Notification",
#     "effective_date": "2015-07-21T06:28:36-05:00",
#     "system_date": "2015-07-21T06:28:36-05:00"
#   },
#   "payload":
#   {
#     "id": 48,
#     "options": {
#       "devices": "android => e25454608b6097bc412be42ad9bf39797a698925d947b9d136cbb992f649cc96",
#       "alert_message": "This is a sample push notification message",
#       "badge_count": 0,
#       "created_at": "2015-07-21T06:28:36-05:00",
#       "id":48,
#       "member_id": 25,
#       "notification_type": "Reminder",
#       "silent": false,
#       "updated_at": "2015-07-21T06:28:36-05:00"
#     }
#   }
# }

# Sample out puts
# =====================
# payload 1:
#   user_id: 49,
#   message: "You have 10 notifications ",
#   message_type: 'Reminder',
#   pop_up: false,
#   publish_at: '2015-07-21T06:28:36-05:00',
#   target: 'ios',
#   device_id: 'e25454608b6097bc412be42ad9bf39797a698925d947b9d136cbb992f649cc96'

# payload 2:
#   user_id: 48,
#   message: "This is a sample push notification message",
#   message_type: 'secure_message',
#   pop_up: true,
#   publish_at: '2015-07-21T06:28:36-05:00',
#   target: 'gcm',
#   device_id: 'e25454608b6097bc412be42ad9bf39797a698925d947b9d136cbb992f649cc96'

require 'json'

class Message
	attr_accessor :user_id, :publish_at, :message, :message_type, :pop_up, :target, :device_id

	def initialize (hash_string)
		hash = parse_hash hash_string
		# Once the string is parsed into a hash, we can assign the values to the properties of the class
		# based on the values we get from the hash and given requirements
		if hash.key?('properties')
			@publish_at = !hash['properties']['effective_date'].nil? ? hash['properties']['effective_date'] : nil
		end
		if hash.key?('payload') && !hash['payload']['options'].nil?
			user_id  = !hash['payload']['id'].nil? ? hash['payload']['id'] : nil
			@user_id = user_id

			payload_options = hash['payload']['options']

			alert_message = !payload_options['alert_message'].nil? ? payload_options['alert_message'] : nil
			silent = !payload_options['silent'].nil? ? payload_options['silent'] : false
			badge_count = " "
			badge_count = payload_options['badge_count'] if silent == true
			alert_message.sub! "following", badge_count.to_s if alert_message.include? "following"
			@message = alert_message.strip

			notification_type = !payload_options['notification_type'].nil? ? payload_options['notification_type'] : nil
			@message_type = notification_type

			@pop_up = !silent 

			devices = !payload_options['devices'].nil? ? payload_options['devices'] : nil
			if !devices.nil? && devices.include?('=>')
				device_info = devices.split('=>')
				@target = device_info[0].strip
				@device_id = device_info[1].strip
			end

		end
		
	end

	def parse_hash hash
		# Json is also a key value pair structure
		# input hash is in the form or string 
		# hence we can use JSON.parse function that converts a json into a hash
		if !hash.nil? || !hash.empty?
			my_hash = JSON.parse(hash)
			return my_hash
		end
	end
end

#Please see spec file for test and its verified outputs


