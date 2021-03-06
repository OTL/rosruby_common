#!/usr/bin/env ruby

require 'ros'
require 'std_msgs/String'

node = ROS::Node.new('/rosruby/sample_subscriber')
message = node.get_param('~message', 'message come!')

node.subscribe('/chatter', Std_msgs::String) do |msg|
  puts "#{message}: #{msg.data}"
end

node.spin
