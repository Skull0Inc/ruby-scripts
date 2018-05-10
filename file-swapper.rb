#!/home/chris/.rbenv/shims/ruby

#by Skull0inc: > 10/05/2018
#script v0.001

=begin
  P u r p o s e :> Learning Ruby: #0004
  ******************************************
  This script takes in two base filename
  inputs without the extension name and 
  swaps them in a single or array of many 
  specified folders.
  ******************************************
  
  # General idea.
	# file1 --> tmp_path
	# file2 --> file1 
	# tmp_path --> file2

  change the 'folders' input list to specify
  folder or list to operate on.
=end

require "fileutils"

	# Added ability to work on multiple folders within script path
	file1 = ""
	file2 = ""
	tmp_ext  = ".tmp"
	#set input folder names
	folders = %w(375 480 800 1600)

	# Set arguments list
  args = ARGV

 folders.each do |folder|

	 puts "folder: " + folder
	#Exactly two files to swap, takes in basename without extension
	file1 = Dir.glob("#{folder}/#{args[0]}*").first
	file2 = Dir.glob("#{folder}/#{args[1]}*").first

	# Get absolute paths
	# NOTE operation folder name already pre-pended
	path1 = File.absolute_path(file1) 
	path2 = File.absolute_path(file2)

	#First path broken down
	#dir_name = File.dirname(path1) + folder + "/" #pre-pended folder to pathname with added '/'
	file_name = File.basename(path1, ".*") #basename excluding extension
	file_ext = File.extname(path1)

	tmp_path = file_name + tmp_ext
	
	#Test output 
	 #puts "#{File.basename(path1)} ---> #{File.basename(tmp_path)}" 
	 #puts "#{File.basename(path2)} ---> #{File.basename(path1)}" 
	 #puts "#{File.basename(tmp_path)} ---> #{File.basename(path2)}" 
	 puts "#{File.basename(path1)} <---> #{File.basename(path2)}" 


	 # Execute Renaming
	 FileUtils.mv(path1, tmp_path)
	 FileUtils.mv(path2, path1)
	 FileUtils.mv(tmp_path, path2)

	 #Update folder indexing
   # NOTE There were problems with Nautilus not updating new thumbnails after script is done.
	 folder_path = File.dirname(path1)
	 FileUtils.cd(folder_path)
	 FileUtils.touch Dir.glob('*.*')
	 FileUtils.cd("../") # get back to script path
 end
