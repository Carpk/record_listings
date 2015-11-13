class SortList
  class << self

    def method_missing(name, *args)
      attribute = name.to_s.split('_')[1]
      return super unless name =~ /^by_\w+/

      args[0].sort_by {|record| record.send(attribute)}
    end
  end
end
