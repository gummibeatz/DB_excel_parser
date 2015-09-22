class Clothing

	def initialize()

	end

	def create_attr_accessor(var)
		singleton_class.class_eval do
			attr_accessor "#{var}"
		end
		# send("#{var}=", value)
	end 
	# def my_attr_accessor(*args)

	#     # iterate through each passed in argument...
	#     args.each do |arg|
	#  		puts arg
	#         # getter
	#         self.class_eval("def #{arg};@#{arg};end")
	 
	#         # # setter
	#         # self.class_eval("def #{arg}=(val);@#{arg}=val;end")
	 
	#     end
	# end

end
