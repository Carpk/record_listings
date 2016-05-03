class PortalDisplay < RecordDisplay

  def self.display_list(list)
    list.map { |person| self.create_string(person) }
  end
end
