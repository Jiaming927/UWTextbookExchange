import sqlite3 

db = sqlite3.connect("../UWTextbookExchange/db/development.sqlite3")
print "Connection established"
file = open("*TextBookFile.txt")
print "File found\n"

print "============================================================\n"

lines = file.readlines()
course_name = ""
book = ""
queryContent = ""
queryStart = ""
queryBooks = ""
finalQuery = ""
i = 0

while i < len(lines):
	if lines[i].startswith("*"):
		course_name = lines[i][1:].strip()
		course_name = "".join(course_name.split())
		i += 1
		queryStart = "\"" + course_name + "\""
	else:
		print course_name + "...START \n"
		index = 1
		bookCount = "book1"
		while i < len(lines) and not lines[i].startswith("*"):
			queryBooks += ", \"" + lines[i].strip() + "*" + lines[i + 1].strip() + "*" + lines[i + 2].strip() + "\""
			if not index == 1:
				bookCount += ",book" + str(index)
			index += 1
			i += 3
		
		print course_name + "...DONE \n"
		queryContent = queryStart + ",\"" + str(index) + "\"" + queryBooks
		finalQuery = "INSERT INTO courses " + "(course_name, number, " + bookCount + ") VALUES(" + queryContent + ")"
		db.execute(finalQuery)
	queryBooks=""
db.commit()
db.close()
#"INSERT INTO courses("

# books = "book1"

# #strip everything before this
# for i in len(textbooks) - 1:
# 	books += "book" + str(i)

# books = "book"

# INSERT INTO courses (course_name, number, book1) VALUES("CSE 142", str(number), "BUILDING JAVA PROGRAM");

# query = "INSERT INTO books (ID,NAME,AGE,ADDRESS,SALARY) \ VALUES (1, 'Paul', 32, 'California', 20000.00 )"

# print query
