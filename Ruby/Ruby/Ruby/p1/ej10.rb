def a_ul(hash)
	%Q{<ul>#{hash.map do |each|
		"<li>""<li>"
	end}<ul>}
end

puts a_ul({ perros: 1, gatos: 1, peces: 0})