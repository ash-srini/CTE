#test Message.rb
require_relative 'Message'

describe Message do 
	it "Should create a new message object with correct variable values" do 
		hash_string1 = '{
 		"properties": {
  			"user_id":43,
  			"managing_user_id":43,
   		 	"description":"Push Notification",
    		"effective_date":"2015-07-20T06:28:36-05:00",
   			"system_date":"2015-07-20T06:28:36-05:00"
 		 },
  		"payload":{
    		"id": 49,
    		"options": {
      			"devices": "ios => e25454608b6097bc412be42ad9bf39797a698925d947b9d136cbb992f649cc96",
      			"alert_message": " You have following notifications ",
      			"badge_count":10,
      			"created_at":"2015-07-20T06:28:36-05:00",
      			"id":48,
      			"member_id":25,
      			"notification_type": "secure_message",
      			"silent":true,
      			"updated_at":"2015-07-20T06:28:36-05:00"
    		}
  		}
		}'
	message1 = Message.new hash_string1
	expect(message1.user_id).to eq 49
	expect(message1.message).to eq "You have 10 notifications"
	expect(message1.message_type).to eq "secure_message"
	expect(message1.pop_up).to be false
	expect(message1.publish_at).to eq "2015-07-20T06:28:36-05:00" 
	expect(message1.target).to eq "ios"
	expect(message1.device_id).to eq "e25454608b6097bc412be42ad9bf39797a698925d947b9d136cbb992f649cc96"

	hash_string2 = '{
  	"properties": {
    	"user_id": 43,
    	"managing_user_id": 43,
    	"description": "Push Notification",
    	"effective_date": "2015-07-21T06:28:36-05:00",
    	"system_date": "2015-07-21T06:28:36-05:00"
  		},
  	"payload":{
    	"id": 48,
    	"options": {
      		"devices": "android => e25454608b6097bc412be42ad9bf39797a698925d947b9d136cbb992f649cc96",
      		"alert_message": "This is a sample push notification message",
      		"badge_count": 0,
      		"created_at": "2015-07-21T06:28:36-05:00",
      		"id":48,
      		"member_id": 25,
      		"notification_type": "Reminder",
      		"silent": false,
      		"updated_at": "2015-07-21T06:28:36-05:00"
  		  }
  	}
	}'

	message2 = Message.new hash_string2
	expect(message2.user_id).to eq 48
	expect(message2.message).to eq "This is a sample push notification message"
	expect(message2.message_type).to eq "Reminder"
	expect(message2.pop_up).to be true
	expect(message2.publish_at).to eq "2015-07-21T06:28:36-05:00" 
	expect(message2.target).to eq "android"
	expect(message1.device_id).to eq "e25454608b6097bc412be42ad9bf39797a698925d947b9d136cbb992f649cc96"


	#puts message1.message
	end



end