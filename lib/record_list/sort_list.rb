class SortList
  class << self

    def load_by(load_type, list)
      list.sort_by {|record| record.send(load_type)}
    end
  end
end
