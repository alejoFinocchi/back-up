class Templates

	def self.renderStatic(template)
		file = File.open("templates/#{template}.tpl", "rb")
		tpl = file.read.gsub("\n", "").gsub("\t", "")
		file.close
		tpl
	end

	def self.render(template, args=[])
		args = args.each
		tpl = ""
		file = File.open("templates/#{template}.tpl", "rb")
		file.each_line do |line|
			line = self.changeLine(line, args)
		 	tpl << line.gsub("\n", "").gsub("\t", "")
		end
		file.close
		tpl
	end

	def self.changeLine(string, args=[])
		string.chars.map do |a|
			begin
			a =~ /\`/ ? args.next : a
			rescue StopIteration
				
			end
		end.join
	end
end