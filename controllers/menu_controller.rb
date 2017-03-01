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
		print "Search by name: "
		name = gets.chomp
		
		match = address_book.binary_search(name)
		system "clear"
		
		if match
			puts match.to_s
			search_submenu(match)
		else
			puts "No match found for #{name}"
		end
	end

	def read_csv
		print "Enter CSV file to import: "
		file_name = gets.chomp
		
		if file_name.empty?
			system "clear"
			puts "please enter a file name!"
			main_menu
		end
		
		begin 
			entry_count = address_book.import_from_csv(file_name)
			system "clear"
			puts "#{entry_count} new entries added from #{file_name}"
		rescue
			puts "#{file_name} is not a valid CSV file, please enter the name of a valid CSV file."
			read_csv
		end
	end

	def entry_submenu(entry)
		puts "n - next entry"
		puts "d - delete entry"
		puts "e - edit this entry"
		puts "m - return to main menu"

		selection = gets.chomp

		case selection
			when "n"
			when "d" then delete_entry(entry)
			when "e" 
				edit_entry(entry)
				entry_submenu(entry)
			when "m"
				system "clear"
				main_menu
			else 
				system "clear"
				puts "#{selection} is not a valid input"
				entry_submenu(entry)
		end
	end
	
	def search_submenu(entry)
		puts "\nd-delete entry"
		puts "e - edit this entry"
		puts "m - return to main menu"
		
		selection = gets.chomp
		
		case selection
			when "d"
				system "clear"
				delete_entry(entry)
				main_menu
			when "e"
				edit_entry(entry)
				system "clear"
				main_menu
			when "m"
				system "clear"
				main_menu
			else 
				system "clear"
				puts "#{selection} is not a valid input"
				puts entry.to_s
				search_submenu(entry)
		end
	end
	
	def delete_entry(entry)
		address_book.delete(entry)
		puts "#{entry.name} has been deleted"
	end
	
	def edit_entry(entry)
		print "Updated Name: "
		name = gets.chomp
		print "Updated Phone Number: "
		phone_number = gets.chomp
		print "Updated Email: "
		email = gets.chomp
		
		entry.name = name if !name.empty?
		entry.phone_number = phone_number if !phone_number.empty?
		entry.email = email if !email.empty?
		
		system "clear"
		puts "Updated Entry: "
		puts entry
	end
end

