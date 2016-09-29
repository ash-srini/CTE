# Create an instance method Array#my_map. This method has to copy the behavior of the original Array#map method.

# Examples

# a = [1, 2, 3, 4]

# a.my_map do |x|
#   x + 1
#   end

# #=> [2, 3, 4, 5]
# a = [1, 2, 3, 4]

# a.my_map(&:to_s)

# #=> ["1", "2", "3", "4"]


class ArrayMap

=begin
 Instance method is methods that can be called only by the instance of the class in whihc the method is defined
 Here, I definded a class ArrayMap and defined the methods do eachof the three required functions
 Once we instantiate the class using the new mwthod we can call these methods with the instance we create
 Please see spec for the method call and its output
=end


	def my_map array
		if !array.nil?
			# map! method modifies the array in place. 
			# We can use map to store the new array in another variable as well 
			# if we don't want to chnage the original array
			if is_integer_array? array
				array.map! {|x| x+1}
			else
				return "Not an Integer array"
			end
		else
			return "Array is nil"
		end
	end

	def map_to_string array
		if !array.nil?
			array.map!(&:to_s)
		else
			return "Array is nil"
		end
	end

	def my_sort array
		if !array.nil?
			# Same as map! and map methods, sort! does in place sort and sort method returns a new sorted array
				array.sort!
		else
			return "Array is nil"
		end
	end

	#check if all elements of the array is an integer
	def is_integer_array? array
		return array.all? {|a| a.is_a? Integer}
	end
end




