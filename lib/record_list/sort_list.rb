class SortList
  class << self

    def by_gender(records)
      first = []
      last = []
      records.each do |record|
        if record.gender == "Female"
          first << record
        else
          last << record
        end
      end
      first + last
    end

    def by_birthdate(records)
      records.sort_by! {|record| record.birthdate}
    end

    def by_lastname(records)
      records.sort_by! {|record| record.last_name}
    end
  end
end
