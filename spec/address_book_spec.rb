require_relative "../models/address_book.rb"

RSpec.describe AddressBook do
    describe "attributes" do
        it "responds to entities" do
            book = AddressBook.new
            expect(book).to respond_to(:entries)
        end 
        
        it "should be an array" do
            book = AddressBook.new
            expect(book.entries).to be_an(Array)
        end
        it "should equal 0" do
            book = AddressBook.new
            expect(book.entries.size).to eq(0)
        end
    end
    describe "#add_entry" do
        it "adds only one entry to the address book" do
            book = AddressBook.new
            book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
            
            expect(book.entries.size).to eq(1)
        end
        
        it "adds the correct information to the address book" do
            book = AddressBook.new
            book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
            
            expect(book.entries[0].name).to eq("Ada Lovelace")
            expect(book.entries[0].phone_number).to eq("010.012.1815")
            expect(book.entries[0].email).to eq('augusta.king@lovelace.com')
        end
    end
end