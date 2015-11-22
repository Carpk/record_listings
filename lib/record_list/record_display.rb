class RecordDisplay

  def self.create_string(line)
    ivars = line.instance_variables
    str = ""
    ivars.each do |ivar|
      str << %Q!#{line.send(ivar[1..-1])}, !
    end
    str[0..-3]
  end
end
