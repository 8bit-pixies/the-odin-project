def stock_picker(stocks)
    # find the greatest difference between two stocks, with the index of the 
    # first less than the second.
    buy = 0
    sell = 0
    max_profit = -1
    
    stocks.each_with_index do |b, i|
        stocks[i+1..-1].each_with_index do |s, j|
            if (s - b > max_profit)
                max_profit = s- b
                sell = i+j+1
                buy = i
                #puts max_profit, buy, sell
            end
        end
    end
    [buy, sell]
end


print stock_picker([3,1,15])
puts
print stock_picker((0..10).to_a)
puts
print stock_picker([1,10])
puts



