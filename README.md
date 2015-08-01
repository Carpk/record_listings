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

To post a record, use curl in another terminal session.
With the format of "lastname firstname gender fav_color birthmonth birthday birthyear":

`curl --form record="Black Lewis Male Black 8 30 1948" http://localhost:9292/records`
