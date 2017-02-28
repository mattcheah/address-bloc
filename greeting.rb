def greeting
	first, *people = ARGV
	people.each do |arg|
			puts first+" "+arg
	end
end
greeting
