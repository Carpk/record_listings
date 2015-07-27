class ListDisplay

  def show(data)
    data.each do |line|
      print line.inspect
      puts
    end
  end
end
