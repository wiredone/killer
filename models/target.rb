require( 'pg' )
require_relative( '../db/sql_runner' )

class Target

  attr_accessor( :id, :name, :player_id )

  def initialize( options )
    @id = options['id'].to_i
    @name = options['name']
    @player_id = options['player_id'].to_i
  end

  def save()
    sql = "INSERT INTO targets (name, player_id) VALUES ( '#{@name}', #{@player_id} )  RETURNING *"
    target = SqlRunner.run( sql )[0]
    result = Target.new( target )
    return result
  end


  
#  def player()
#    sql = "SELECT * FROM artists WHERE id = #{@artist_id}"
#    artist = SqlRunner.run( sql )
#    result = Artist.new (artist.first)
#    return result
#     return "hello"
#  end

#  def self.find( id )
#    sql = "SELECT * FROM albums WHERE id = #{id}"
#    album = SqlRunner.run( sql ).first
#    result = Album.new( album )
#    return result
#  end


end

  
