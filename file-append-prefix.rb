#!/usr/bin/env ruby

#by Skull0inc: > 07/06/2014
#script v0.001
=begin
  P u r p o s e :> Learning Ruby: #0003
  ******************************************
  This script RECURSIVELY renames files for
  a given path, matching extension and new
  prefix to append to file name: by default
  ******************************************
  
  EDIT [dir_name,file_name, file_ext] where applicable:>
  whether to search and replace a section of a path, 
  add prefix / postfix to actual name to
  changing the extension or filepath directory.
  
  UNCOMMENT to enable functionality.
=end

require 'find'

#vars:currently used in CLI.
abs_path = [] #absolute path name
search_ext = "" #extension name to find
prefix = "" #prefix string to append

#CLI for getting user options (not greatest method, but works for now!)

#absolute path for script to begin execution.
puts "Enter absolute-path to folder :>"
abs_path = $stdin.gets.chomp

#search paramater matching extension
puts "Enter file extension('.xyz') to match in folders :>"
search_ext = $stdin.gets.chomp

#perform validation here: to come :>
abs_path = abs_path.strip


Find.find(abs_path) do |path|
    
        # if file_path matches extension
        if File.extname(path) == search_ext
         
          #break-down dir_name + file_name + file_ext
          dir_name = File.dirname(path) + "/" #pathname with added '/'
          file_name = File.basename(path, ".*") #basename excluding extension
          file_ext = File.extname(path)
          
          #TEST-LOG: breakdown
            #puts "Dir: #{dir_name}"
            #puts "Name: #{file_name}"
            #puts "Ext: #{file_ext}"
          
          #REF: ye old pathname
          old_path = dir_name + file_name + file_ext
          
          #OPERATIONS LIST Examples: EDIT to suit purpose
          
          #OPTION A: Allow adding of prefix to name
            #file_name = "prefix_" + file_name
          
          #OPTION B: Replace matching string in filename 
            #file_name = file_name.gsub("string_to_match","replacement_string")
          
          #OPTION C: Strip all whitespace and replace with ('-') by default
            #use .strip to remove trailing / leading whitespace
            #file_name = file_name.gsub(/\s+/, "-")
            
          
          #SET the new path AFTER any operations on vars:[dir_name, file_name, file_ext]
          new_path = dir_name + file_name + file_ext
            
          puts "#{old_path} ---> #{new_path}"  
          
           #LASTLY, UNCOMMENT carry out the actual renaming process.
           #File.rename(old_path, dir_name + file_name + file_ext)
        end
    
end

#Known Issues?
=begin
The script needs some basic error handling & validation checking!

ALSO consider for use:> 
potentially match up against a list of accepted file formats

accepted_formats = [".txt", ".pdf"]
accepted_formats.include? File.extname("/path/to/file/example.pdf")
=end


