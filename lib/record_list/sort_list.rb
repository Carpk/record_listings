class SortList


  def self.by_gender(records)
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

  def by_birthdate

  end

  def by_lastname

  end
end
