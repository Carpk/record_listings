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

  def self.by_birthdate(records)
    records.each_with_index do |record,index|
      date_array = record.birthdate
      records[index].birthdate = Date.new(date_array[2].to_i,date_array[0].to_i,date_array[1].to_i)
    end
    records.sort_by! {|record| record.birthdate}
  end

  def self.by_lastname(records)
    records.sort_by! {|record| record.last_name}
  end
end
