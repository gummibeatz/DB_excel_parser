require 'rubygems'
require 'roo'
require 'json'
require_relative 'Clothing.rb'
require_relative 'excel_parser.rb'

book = Roo::Excelx.new("Database.xlsx")
sheets = book.sheets
clothes = Array.new(2)
counter = 0
sheetbreak = 0
for sheet in sheets
	if sheetbreak == 2
		break
	end
	sheetbreak+=1
	first_col = book.first_column(sheet)
	last_col =  book.last_column(sheet)
	start_row = book.first_row(sheet)+2
	last_row = book.last_row(sheet)

	clothes_traits = Array.new()
	clothes_categories = Clothing.new()
	jsons = Array.new()

	setup_clothes(book, sheet, clothes_traits, 
		clothes_categories, first_col, last_col)


	for row in start_row..last_row
		jsons << create_json(book, sheet, clothes_traits,
			clothes_categories, first_col, last_col, row)
	end

	clothes[counter] = jsons
	counter+=1

end

File.open("DatabaseArray.json","w") do |f|
	f.write(clothes)
end
