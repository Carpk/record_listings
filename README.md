#Record List

Record listings was a code challenge from late '15. The object of this challenge was to start with a terminal interface that could bring up a list of users and sort them by attribute. User lists are saved in 3 separate files, each using a different syntax. Once this portion was completed, a [grape API](https://github.com/ruby-grape/grape) was to be implemented and data query types were sent through the URL. Bonus points were supposedly given for posting a record and having it saved in the database.

##Requirements

Ruby 2.2.2, Rack, Grape

##Getting Started

Run the following commands from the root directory:

1)`bundle`

2)`rake start`

Use the following URL paths to query files:

[GET /records/gender](http://localhost:9292/records/gender)

[GET /records/birthdate](http://localhost:9292/records/birthdate)

[GET /records/name](http://localhost:9292/records/lastname)

To post a record, use curl in another terminal session, with the following format:

record="lastname firstname gender favcolor birthmonth birthday birthyear"

Example:

`curl --form record="Black Lewis Male Black 8 30 1948" http://localhost:9292/records`

To run tests:

`rake rspec`

To run the application in terminal:

`rake run`
