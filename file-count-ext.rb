#!/usr/bin/env ruby

#by Skull0inc: > 07/06/2014
#script v0.002

=begin
  P u r p o s e :> Learning Ruby: #0001
  ******************************************
  This script RECURSIVELY searches a given
  file path [1] for files with a specified 
  extension to return a file-count [2].
  ******************************************
  [1]:original intention
  [2]:updated to count files
=end

require 'find'

#vars
abs_path = []
ext_name = ""
ext_count = 0

#CLI
puts "Enter absoute-path to folder :>"
abs_path = $stdin.gets.chomp.strip

puts "Enter file extension('.xyz') to match :>"
ext_name = $stdin.gets.chomp


Find.find(abs_path) do |path|
  
        if File.extname(path) == ext_name
          
          #Do stuff here
          ext_count += 1
          
        end
end

puts  "#$ext_name" + " count -->" + ext_count.to_s

#Known Issues?
=begin
hangs on searching in some folders 
=end
