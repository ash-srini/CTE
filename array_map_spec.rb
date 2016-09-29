# #Task 2 Test

require_relative "ArrayMap"

describe ArrayMap do
	it "should take integer array input and return incremented integer array" do
		array1 = [1,2,3,4]
		amap = ArrayMap.new
		expect(amap.my_map array1).to eql [2,3,4,5]

		array2 = [19, 29, 39, 49, 59]
		expect(amap.my_map array2).to eql [20, 30, 40, 50, 60]
	end

	it "should return messge if array is not an integer array" do 
		array1 = ['1','2','3','4']
		amap = ArrayMap.new
		expect(amap.my_map array1).to eql "Not an Integer array"
	end

	it "should take integer array as input and return string array" do 
		array1 = [1,2,3,4]
		amap = ArrayMap.new
		expect(amap.map_to_string array1).to eql ['1', '2', '3', '4']
	end

	it "should take an unsorted array and return a sorted array" do
		array1 = [7, 2, 3, 4]
		amap = ArrayMap.new
		expect(amap.my_sort array1).to eql [2, 3, 4, 7]

		array3 = ['7', '2', '3', '4']
		expect(amap.my_sort array3).to eql ['2', '3', '4', '7']
	end

	it "should return message if input array is nil" do 
		arr = nil
		amap = ArrayMap.new
		expect(amap.my_sort arr).to eql "Array is nil"
		expect(amap.map_to_string arr).to eql "Array is nil"
		expect(amap.my_sort arr).to eql "Array is nil"
	end

	it "should return empty array is input array is empty" do
		arr = []
		amap = ArrayMap.new
		expect(amap.my_sort arr).to eql []
		expect(amap.map_to_string arr).to eql []
		expect(amap.my_sort arr).to eql []
	end
 end
