
# README

## Installation

1. Install ruby locally using `rbenv` or `rvm`
	a. Install bundler to your new ruby version: `gem install bundler`
2. Install the project gems using `bundle install`
3. Run `rake db:setup` to create your development and test DBs
4. Run the local server with `bundle exec rails server`
5. Enjoy!

## Overview

The purpose of this app is to serve as a simple dashboard for Upcoming Events and Event Activity for a Calendly account. 

The app works by providing an endpoint for receiving inbound messages from the Calendly API at `/api/webhooks`. There is a rake task provided for registering the app's endpoint, `rake webhook:register`. Once the message is received, it is first saved to the database as an instance of the `Message` class with the `payload` jsonb column saving the full request body.

Once the `Message` instance is saved, the contents are saved as an `Event` and `Invitee` records, which are used to power the dashboard page. The dashboard page, located at `/` shows up to 10 upcoming events, along with the last 10 messages received


