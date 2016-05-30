require_relative "../lib/record_list/console.rb"

RSpec.describe "File Parser" do

  let(:parser) { FileParser.new 'spec/test_db/test_data'}


  it "should create object of the correct class" do
    expect(parser.class).to eq(FileParser)
  end

  it "should read test files from initialize" do
    finished_array = parser.load_listed
    expect(finished_array.last.lastname).to eq("Feynman")
  end
end

