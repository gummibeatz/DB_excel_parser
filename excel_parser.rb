
require 'rubygems'
require 'roo'
require 'json'
require_relative 'Clothing.rb'

### Simplify at some point
### wanted to try out ruby metaprogramming
###

def setup_clothes(book, sheet, clothes_traits, 
	clothes_categories, first_col, last_col)
	for i in first_col..last_col
		# changes all spaces to underscores
		clothes_traits << book.cell(2,i,sheet).gsub(" ","_")
		if clothes_traits[i-1] == "file_name"
			clothes_categories.create_attr_accessor("#{clothes_traits[i-1]}")
			clothes_categories.file_name = i
		end
	end
end

def create_json(book, sheet, clothes_traits, 
	clothes_categories, first_col, last_col, row)
	map = Hash.new()
	map["file_name"] = book.cell(row, clothes_categories.file_name, sheet)
	###EDIT HERE AT SOME POINT!!!!!
	map["url"] = nil
	#### !!!!!!!!!!!
	properties_map = Hash.new()
	properties_map["main_category"] = sheet[0...-1]
	for i in first_col..last_col
		cell = book.cell(row,i,sheet)
		if cell != nil
			properties_map["#{clothes_traits[i-1]}"] = book.cell(row,i,sheet)
		else 
			properties_map["#{clothes_traits[i-1]}"] = "NA"
		end
	end
	#map["properties"] = properties_map
  map.merge!(properties_map)	
  return map.to_json 
end
