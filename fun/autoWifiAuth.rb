#!/usr/bin/env ruby

require 'net/http'

params = [
  "cmd=authenticate",
  "user=cu006532",
  "password=123456",
  "Login=Log In"
]

data = params.join("&")
begin 
  http = Net::HTTP.new("10.3.16.2")
  http.open_timeout = 2
  http.read_timeout = 2
  res = http.post("/cgi-bin/login",data) 
  msg =  /Authentication failed/ =~ res.body \
         ? "Auth Failure" \
         : "Auth Ok"
rescue Timeout::Error
  msg = "Already Authed!"
rescue StandardError => e
  msg = "Error : " + e.inspect
ensure
  puts msg
  http.finish if http.started?
end
