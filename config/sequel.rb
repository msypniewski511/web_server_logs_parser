# frozen_string_literal: true

require 'sequel'

DB = Sequel.connect('sqlite:/') # memory database, requires sqlite3

DB.create_table :lists do
  primary_key :id
  String :path
  String :visitor_id # Webserver log dosn't provide valid IP addresses
end
