sum_file = File.new('sum_file.sum', 'r')
sum_file_hashed = File.new('sum_file_hashed', 'w')

	while (line = sum_file.gets )
		case line
		when /\*{3}/ #Find Sections by ***
			l = line.gsub('*', '').strip
			sum_file_hashed.puts('Found a section: ' + l )
		end	
	end

sum_file.close
sum_file_hashed.close