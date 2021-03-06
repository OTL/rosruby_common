#!/usr/bin/env ruby

require 'ros'
require 'roscpp_tutorials/TwoInts'

if ARGV.length < 2
  puts "usage: #{$0} a b"
  exit 1
end

node = ROS::Node.new('sample_service_client')

if node.wait_for_service('/add_two_ints', 1)
  service = node.service('/add_two_ints', Roscpp_tutorials::TwoInts)
  req = Roscpp_tutorials::TwoIntsRequest.new
  res = Roscpp_tutorials::TwoIntsResponse.new
  req.a = ARGV[0].to_i
  req.b = ARGV[1].to_i
  if service.call(req, res)
    p res.sum
  end
end
