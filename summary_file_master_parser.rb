sum_file = File.new('sum_file.sum', 'r')
sum_file_hashed = File.new('sum_file_hashed', 'w')


require 'pp'

blocks = sum_file.readlines.map(&:strip).reject{ |l| l == '' }.slice_before(/\A\*{3}/)


sum_section = {}
blocks.each do |block|
  case block.shift
  when /Simulation CFD Summary File Output/
  	#sum_file_hashed.write(block)
  	#hash[:sim_sum_out] = Hash[block.map{ |r| r.split(/\=/) }]
  	sva = block[0].gsub(/[\[\]]/,'').split( /[\(\)]/ ).collect(&:strip)
  	sum_section[:sim_version] = {name: sva[0], code_name: sva[1], date_code: sva[2] } 
  	sum_file_hashed.puts( sum_section[:sim_version] )
  	

  when /Analysis Information/
    # process the analysis information
    sum_section[:analysis_information] = Hash[block.map{ |r| r.split(/ +is +/) }]
    sum_file_hashed.puts(sum_section[:analysis_information])

  when /Field Variable Results/
    # process the field variable results

  end
end


#sum_file_hashed.write(blocks.to_a)


sum_file.close
sum_file_hashed.close

=begin
	
	while (line = sum_file.gets )
		case line
		when /\*{3}/ #Find Sections by ***
			l = line.gsub('*', '').strip
			sum_file_hashed.puts('Found a section: ' + l )
		end	
	end
	
=end