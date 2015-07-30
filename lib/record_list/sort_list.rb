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

  def self.day_ordering(list, matching_index, new_record)
     if list[matching_index].birthdate[1].to_i > new_record.birthdate[1].to_i
      list.insert(matching_index, new_record).pop
    else
      list.insert(matching_index + 1, new_record).pop
    end
    list
  end

  def self.month_ordering(list, matching_index, new_record)
    if list[matching_index].birthdate[0].to_i == new_record.birthdate[0].to_i
      SortList.day_ordering(list, matching_index, new_record)
    elsif list[matching_index].birthdate[0].to_i > new_record.birthdate[0].to_i
      list.insert(matching_index, new_record).pop
    else
      list.insert(matching_index + 1, new_record).pop
    end
    list
  end

  def self.set_in_list(ordered_list, record)
    ordered_list.each_with_index do |ordered_space, index|
      if ordered_space == "empty"
        ordered_list[index] = record
        break
      elsif ordered_space.birthdate[2].to_i == record.birthdate[2].to_i
        SortList.month_ordering(ordered_list, index, record)
        break
      elsif ordered_space.birthdate[2].to_i > record.birthdate[2].to_i
        ordered_list.insert(index, record).pop
        break
      end
    end
    ordered_list
  end

  def self.by_birthdate(records)
    ordered_list = Array.new(records.length, "empty")
    records.each do |record|
      SortList.set_in_list(ordered_list, record)
    end
    ordered_list
  end

  def by_lastname

  end
end
