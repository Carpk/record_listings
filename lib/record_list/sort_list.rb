class SortList
  class << self

    def by_gender(records)
      records.sort_by {|record| record.gender}
    end

    def by_birthdate(records)
      records.sort_by {|record| record.birthdate}
    end

    def by_lastname(records)
      records.sort_by {|record| record.last_name}
    end
  end
end
