class RecordDisplay

  def self.create_string(line)
    ivars = line.instance_variables
    ivars.map! { |ivar| line.send(ivar[1..-1]) }

    ivars.join(", ")
  end
end
