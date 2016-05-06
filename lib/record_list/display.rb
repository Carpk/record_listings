module Display

  def create_text_of(person)
    attributes = person.instance_variables
    traits_array = attributes.map { |attr| person.send(attr[1..-1]) }

    traits_array.join(RecordData::DividingString)
  end
end
