class BinarySearch
  def self.chop(target, collection)
    #Return -1 if the collection is empty
    return -1 if collection.empty? or (collection.size == 1 && collection.first != target)
    return target if collection.size == 1 && collection.first == target

    #Get the middle element, index of the current array
    interval_index, interval_element = middle(collection)

    return interval_index if interval_element == target
    # chop(interval_index, collection)
  end

  def self.middle(collection=[])
    last_elements_pos = collection.size
    last_elements_pos += 1 if odd?(last_elements_pos)
    middle_elements_pos = last_elements_pos / 2
    return middle_elements_pos, collection.fetch(middle_elements_pos)
  end

  def self.odd? (number)
    number % 2 == 1
  end
end
