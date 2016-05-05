class BrowserDisplay < Display

  def self.display_list(list)
    list.map { |person| self.create_text_of(person) }
  end
end
