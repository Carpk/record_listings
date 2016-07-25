require_relative "../lib/record_list/console.rb"

RSpec.describe "Record" do

  let(:test_file) {'spec/test_db/test_data'}

  it "should load the testing files" do
    expect(Record.load_listing("birthdate", test_file).first.firstname).to eq("Grace")
  end

  it "should load the testing files" do
    expect(Record.load_listing("lastname", test_file).last.lastname).to eq("Kaku")
  end
end
