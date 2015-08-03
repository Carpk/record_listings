#Record List

##Requirements

Ruby 2.2.2, Rack, Grape

##Getting Started

Run the following commands from the root directory:

1)`bundle`

2)`rackup bin/config.ru`

Use the following URL paths to query files:

[GET /records/gender](http://localhost:9292/records/gender)

[GET /records/birthdate](http://localhost:9292/records/birthdate)

[GET /records/name](http://localhost:9292/records/name)

To post a record, use curl in another terminal session, with the following format:

record="lastname firstname gender fav_color birthmonth birthday birthyear"

Example:

`curl --form record="Black Lewis Male Black 8 30 1948" http://localhost:9292/records`

To run tests:

`rake rspec'

To run the application in terminal:

`rake run`
