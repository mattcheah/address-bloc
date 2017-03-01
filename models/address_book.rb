require_relative "entry"

class AddressBook
    attr_reader :entries
    

    def initialize
        @entries = []
    end
    
    def add_entry(name, phone_number, email)
        index = 0
        
        entries.each do |entry|
            if name < entry.name
                break
            end
            index += 1
        end
        entries.insert(index, Entry.new(name, phone_number, email))
    end
    
    def remove_entry(name, phone_number, email)
        index = 0
        entries.each do |entry|
            if entry.name == name && entry.email == email && entry.phone_number == phone_number
                entries.delete_at(index)
                return
            end
            index += 1
        end
    end    
    
end