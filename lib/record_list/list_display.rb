class ListDisplay

  def self.show(data)
    data.each do |line|
      puts line.inspect
    end
  end
end
