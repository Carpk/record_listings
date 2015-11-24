class PortalDisplay < RecordDisplay

  def self.display_list(list)
    string_list = []

    list.each do |person|
      string_list << self.create_string(person)
    end
    string_list
  end
end
