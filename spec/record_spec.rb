require_relative "../lib/record_list/console.rb"

RSpec.describe "Record" do

  let(:dummy_class) { Class.new { extend Record } }
  let(:test_file) {'spec/test_data'}


  it "should load the testing files" do
  puts dummy_class.methods
    expect(dummy_class.load_files(test_file).first.firstname).to eq("Michio")
  end

  it "should load the testing files" do
    expect(dummy_class.load_files(test_file).last.lastname).to eq("Feynman")
  end
end
