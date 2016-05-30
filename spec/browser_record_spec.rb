require_relative "../lib/record_list/console.rb"

RSpec.describe "BrowserRecord" do

  let(:test_file) {'spec/test_db/test_data'}

  before(:context) do
    require_relative "../config.rb"
  end

  it "should order list by gender" do
    first_listed = "Hopper, Grace, Female, Red, 1906-12-09"
    expect(BrowserRecord.sort_by("gender", test_file).first).to eq(first_listed)
  end

  it "should order list by gender" do
    last_listed = "Feynman, Richard, Male, Blue, 1918-05-11"
    expect(BrowserRecord.sort_by("gender", test_file).last).to eq(last_listed)
  end

  it "should order list by birthdate" do
    first_listed = "Hopper, Grace, Female, Red, 1906-12-09"
    expect(BrowserRecord.sort_by("birthdate", test_file).first).to eq(first_listed)
  end

  it "should order list by birthdate" do
    last_listed = "Kaku, Michio, Male, Green, 1947-01-24"
    expect(BrowserRecord.sort_by("birthdate", test_file).last).to eq(last_listed)
  end

  it "should order list by lastname" do
    first_listed = "Feynman, Richard, Male, Blue, 1918-05-11"
    expect(BrowserRecord.sort_by("lastname", test_file).first).to eq(first_listed)
  end

  it "should order list by lastname" do
    last_listed = "Kaku, Michio, Male, Green, 1947-01-24"
    expect(BrowserRecord.sort_by("lastname", test_file).last).to eq(last_listed)
  end
end

