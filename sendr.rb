require './src/Sendr.rb'

sendr = Sendr.new

sendr.send("test email",
"jessiewootenvisual@gmail.com",
"./Time-Inc-Newsletter-Full-v2.html")
