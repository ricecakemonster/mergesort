  def mergesort(a)
  # if the array size is 0|1 then the list is considered sorted, return sorted array
    if a.length == 0 || a.length == 1
      return a #base case
    end
    # split the list into two halves
    left, right = split_array(a)
    # merge sort each half
    left = mergesort(left)
    right = mergesort(right)
    # combine the sorted halves
    return combine(left, right)
  end

  def split_array(a)
    # find the middle index
    middle = a.length / 2
    # split the array in half - take a look at take and drop in the ruby docs, or use ranges
    left = a[0...middle]
    right = a[middle..-1]
    # return left and right halves of array as separate arrays - did you know a method can return multiple arrays? look it up
    return left, right
  end

  # precondition: a and b are sorted
  def combine(a, b)
    # create a results array
    result = []
    # counters pointing to the index of the smallest elements in each array - you may not need to do this step if you use some fancy ruby methods

    # check that we have elements to compare (neither array can be empty)
    until a.empty? || b.empty?
    # push the smaller element onto the result array
        if a[0] < b[0]
          result << a[0]
          a.shift

        else
          result << b[0]
          b.shift
        end
    end

    # if there are elements left over in a, move them to result
    # if there are elements left over in b, move them to result
    if a.empty?
      result = result + b
    else
      result = result + a
    end
    # return the results array
    return result
  end

  # TEST IT
  a = [6,23,53,1,2,5,62,61,33,21,14,6,23]

  a = a.shuffle
  puts "ORIGINAL \n" + a.to_s
  a = mergesort(a)
  puts "AFTER MERGESORT \n" + a.to_s
