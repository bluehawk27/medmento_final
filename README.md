Medmento
==============

Medmento aims to help patients and their loved ones track the intake and perceived effectiveness of medications that have been prescribed to them.

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



