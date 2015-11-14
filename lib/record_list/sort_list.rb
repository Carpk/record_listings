class SortList
  class << self

    def method_missing(name, *args)
      attribute = name.to_s.split('_').last
      return super unless name =~ /^by_\w+/

      args.first.sort_by {|record| record.send(attribute)}
    end
  end
end
