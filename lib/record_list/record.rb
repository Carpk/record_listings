class Record

  def self.load_files
    parser = FileParser.new
    parser.load_listed
  end
end

