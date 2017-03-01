require_relative "../models/address_book.rb"

class MenuController
	attr_reader :address_book
	
	def initialize
		@address_book = AddressBook.new
	end

	def main_menu
		puts "Main Menu - #{address_book.entries.count} entries"
		puts "1 - View All Entries"
		puts "2 - Create an Entry"
		puts "3 - Search for an Entry"
		puts "4 - Import entries from a CSV"
		puts "5 - Exit"
		print "Enter Your Selection: "
		
		selection = gets.to_i
		
		system "clear"
		
		case selection 
			when 1 then view_all_entries
			when 2 then create_entry
			when 3 then search_entries
			when 4 then read_csv
			when 5 then puts "Good-bye!"; exit(0)
			else puts "Sorry, that is not a valid input."
		end
		
		main_menu 
	
	end

	def view_all_entries
	
		address_book.entries.each do |entry|
			system "clear"
			puts entry.to_s
			entry_submenu(entry)
		end

		system "clear"
		puts "End of Entries."

	end
	
	def create_entry
		system "clear"
		puts "New AddressBloc Entry"
		
		print "Name: "
		name = gets.chomp
		
		print "Phone Number: "
		phone_number = gets.chomp

		print "Email: "
		email = gets.chomp

		address_book.add_entry(name, phone_number, email)

		system "clear"
		puts "New Entry Created"
	end
	
	def search_entries
	end

	def read_csv
	end

	def entry_submenu(entry)
		puts "n - next entry"
		puts "d - delete entry"
		puts "e - edit this entry"
		puts "m - return to main menu"

		selection = gets.chomp

		case selection
			when "n"
			when "d"
			when "e"
			when "m"
				system "clear"
				main_menu
			else 
				system "clear"
				puts "#{selection} is not a valid input"
				entry_submenu(entry)
		end
	end
end

