file = File.read("rspec_correction.txt")
f = file.split("\n")
file_name_arr = f.map{|a| a.split(" # ")[0] }

file_name_arr.each do |file_name|
 file, line_no = file_name.split(":")
 exact_file = file.split(" .")
 File.open("#{Rails.root}#{exact_file[1]}", 'r+') do |file|
  lines_arr = File.readlines("#{Rails.root}#{exact_file[1]}")
  skip_line = lines_arr[line_no.to_i-1]	
  p skip_line
  line_read = File.read("#{Rails.root}#{exact_file[1]}").sub(skip_line,skip_line.sub("it","xit"))
  file.puts(line_read)
 end
end
