class RecordDisplay

  def self.create_string(line)
    ivars = line.instance_variables
    str_ary = ivars.map { |ivar| line.send(ivar[1..-1]) }

    str_ary.join(", ")
  end
end
