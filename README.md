Medmento
==============
Medmento is an application that allows you to schedule phone call reminders in the future for your loved one; reminding them to take their medication at the schedule time. Through the phone's keypad, Medmento can also collect patient data by asking the patient to answer questions on their feelings and pain levels. Medmento aims to help patients and their loved ones track the intake and perceived effectiveness of medications that have been prescribed to them.

##How to set it up
Assuming you are running on a mac, you should be able to start the app with the following steps.

####Twiolio Account(john?)

####Back end
To Run the Rails API background on your local Machine:

1. run rake db:create db:migrate db:seed

2. Open 5 tabs in your terminal and move to this root directory in all. Then in order start the following servers on the commandline with the following commands, each in its own tab.

3. redis server

4. be sidekiq

5. ./bin/ngrok 3000

6. rails s

7. be clockwork config/clock.rb    => This will start the clockwork gem and it will begin pinging the Database for events to fire off.

####Configuration
The url given to you in the ngrok tab must be passed along in in your local .env file for use throughout the app. (ex: BASE_URL=1c1e5a20.ngrok.com/webhooks)

Now you can open the front end file and play with the app.

####Front end

This file holds view templates that allows you to interact with the rails api.  You can run these locally on your machine by launching the index.html in a browser.

The rails api must be up and running for the files to interact with the app. Please refer to the Medmento-api file README for instructions to launch the backend.


##How it works

####Front end

1. once logged in, a user can set a new reminder by clicking on the "Set A Reminder" button in the top left.

2. after adding the reminder details, and clicking save, the reminder event gets saved in the rails api data base.

3. similarly, editing or deleting a reminder on the front end updates or destroys the corresponding event in the back end.

####Back End

1. every 10 seconds (as set by the developers of this app), Clockwork checks the rails api database for a reminder event that matches the current time (i.e., Time.now).

2. when it finds a matching event, clockwork invokes Sidekiq and sends it the event's corresponding data.

3. Sidekiq then passes it to Redis, where it is queued and eventually sent back to Sidekiq when it hits the front of the queue.

4. Sidekiq then calls its Sidekiq worker, which uses the Twilio API as well as the event data to make a call to the appropriate phone number.

