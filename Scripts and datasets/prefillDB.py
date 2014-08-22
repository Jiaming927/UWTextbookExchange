import sqlite3 

db = sqlite3.connect("../UWTextbookExchange/db/production.sqlite3")
cur = db.cursor()
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
new = ""
newcount = 0
exist = ""
existcount = 0
i = 0

while i < len(lines):
	if lines[i].startswith("*"):
		course_name = lines[i][1:].strip()
		course_name = "".join(course_name.split())
		i += 1
		queryStart = "\"" + course_name + "\""
	else:
		index = 1
		bookCount = "book1"
		while i < len(lines) and not lines[i].startswith("*"):
			book_title = lines[i][6:].strip()
			author = lines[i+1][8:].strip()
			price = lines[i+2][7:].strip()
			cur.execute("SELECT id, course_name FROM bookinfos WHERE book_title = ?", (book_title,))
			result = cur.fetchone()			
			if result is None:
				bookinfo_query = "INSERT INTO bookinfos (book_title, author, price, course_name) VALUES(" + "\"" + book_title + "\"" + ", \"" + author + "\""+ ", \"" + price + "\"" + ", \"" + course_name + "\"" + ")"
				db.execute(bookinfo_query)
			else:
				if course_name not in result[1]:
					add_course = ','.join(sorted((result[1] + "," + course_name).split(',')))
					cur.execute("UPDATE bookinfos SET course_name=? WHERE id=?", (add_course, result[0]))		
			queryBooks += ", \"" + book_title + "\""
			if not index == 1:
				bookCount += ",book" + str(index)
			index += 1
			i += 3		
		queryContent = queryStart + ",\"" + str(index-1) + "\"" + queryBooks
		queryBooks=""
		cur.execute("SELECT course_name FROM courses WHERE course_name = ?", (course_name,))
		result = cur.fetchone()			
		if result is None:
			finalQuery = "INSERT INTO courses " + "(course_name, number, " + bookCount + ") VALUES(" + queryContent + ")"
			db.execute(finalQuery)
			new += course_name + ", "
			newcount+=1
		else:
			exist += course_name + ", "
			existcount+=1
db.commit()
db.close()
print "Add " + str(newcount) + " courses \n"
print new
print "============================================================\n"
print str(existcount) + " courses already exist \n"
print exist