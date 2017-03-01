require_relative "../models/entry"

RSpec.describe Entry do
	describe "attributes" do
		
		let(:entry) { Entry.new('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com') }
		
		it "reports its name" do
			expect(entry.name).to eq('Ada Lovelace')
		end

		it "reports its phone number" do
			expect(entry.phone_number).to eq("010.012.1815")
		end

		it "reports its email" do 
			expect(entry.email).to eq("augusta.king@lovelace.com")
		end
	end
	
	describe "#to_s" do
		it "Prints an entry as a string" do
			entry = Entry.new('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
			expected_string = "Name: Ada Lovelace\nPhone Number: 010.012.1815\nEmail: augusta.king@lovelace.com"
			expect(entry.to_s).to eq(expected_string)
		end
	end		
end
