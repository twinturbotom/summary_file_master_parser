sum_file = File.new('sum_file.sum', 'r')
sum_file_hashed = File.new('sum_file_hashed', 'w')

inSection = false

	while (line = sum_file.gets )
		case line
		when /\*{3}/ #Find Sections by ***
			inSection = true
			l = line.gsub('*', '').strip
			sum_file_hashed.puts('Found a section: ' + l )

		end
	if inSection == true
		sum_file_hashed.puts("in section")
	end
		



	end

sum_file.close
sum_file_hashed.close