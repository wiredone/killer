#!/Users/user/.rbenv/shims/ruby
require( 'pg' )


begin

      con = PG.connect :dbname => 'killer', :user => 'user'
      con.exec "DROP TABLE IF EXISTS Players CASCADE"
      con.exec "CREATE TABLE Players(Id SERIAL4 PRIMARY KEY, 
        Name VARCHAR(255))"
      con.exec "DROP TABLE IF EXISTS Targets"
      con.exec "CREATE TABLE Targets(Id SERIAL4 PRIMARY KEY, 
        Name VARCHAR(255), player_id INT REFERENCES Players(id), killed_date timestamp)"
     

ensure

  con.close if con

end
