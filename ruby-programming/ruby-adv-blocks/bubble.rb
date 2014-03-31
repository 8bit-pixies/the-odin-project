def bubble(array)
   # sorts an array using bubble sort
   swap = false
   while swap == false
       swap = false
       for el in 1..(array.length-1)
           if array[el-1] > array[el]
               array[el-1], array[el] = array[el], array[el-1]
               swap = true
           end
       end
   end
   array
end

def bubble_block(array)
    # sorts an array using bubble sort
    swap = false
    while swap == false
        swap = false
        for el in 1..(array.length-1)
            if block_given?
                if yield(array[el-1], array[el]) == 1
                    print "here"
                    array[el-1], array[el] = array[el], array[el-1]
                    swap = true
                end
            end
        end
    end
    array
end

def sorting (arr)
 swapped = true
 until !swapped do 
   swapped = false
   for i in 1...arr.length
     #IF a code block is given THEN yield what the block returns ELSE use default sorting
     if block_given? ? yield(arr[i-1], arr[i]) == 1 : (arr[i-1] <=> arr[i]) == 1
        #parallel assignment, permanently reassigns these to each other
        #loads both, then stores them in new respective positions
         arr[i], arr[i-1] = arr[i-1], arr[i]
         swapped = true
      end
    end
  end
  arr
 end


puts sorting(["hi","hello","hey"]) do |left, right|
    right.length - left.length
end
