class PortalDisplay < RecordDisplay

  def self.display_list(list)
    string_array = []

    list.each do |person|
      string_array << self.create_string(line)
    end
    string_array
  end
end
