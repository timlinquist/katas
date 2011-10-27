class BinarySearch
  def self.chop(target, collection)
    #Return -1 if the collection is empty
    return -1 if collection.empty? or (collection.size == 1 && collection.first != target)
    return 0 if collection.size == 1 && collection.first == target

    #Get the middle element, index of the current array
    interval_index, interval_element = middle(collection)

    #No point in continuing if we've found the target by chance
    return interval_index if interval_element == target

    #Check for middle element
    # if middle is greater than target decrement index and continue searching lower half
    # if middle is less than target increment index and continue searching higher half
    if interval_element > target
      next_collection = (collection.first..collection[interval_index-=1]).to_a
    elsif interval_element < target
      next_collection = (collection[interval_index+=1]..collection.last)
    end

    return interval_index if interval_element == target
    # chop(interval_index, collection)
  end

  def self.middle(collection=[])
    last_elements_pos = collection.size
    last_elements_pos += 1 if last_elements_pos.odd?
    middle_elements_pos = last_elements_pos / 2
    return middle_elements_pos, collection.fetch(middle_elements_pos)
  end
end
