require_relative "entry"

class AddressBook
    attr_reader :entries
    

    def initialize
        @entries = []
    end
    
    def add_entry(name, email, phone_number)
        index = 0
        
        entries.each do |entry|
            if name < entry.name
                break
            end
            index += 1
        end
        entries.insert(index, Entry.new(name, email, phone_number))
    end

end