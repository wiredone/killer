require( 'pg' )
require_relative( '../db/sql_runner' )
require_relative( 'target' )


class Player

  attr_accessor( :id, :name)

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO players (name) VALUES ( '#{@name}' ) RETURNING *"
    player = SqlRunner.run( sql ).first 
    result = Player.new( player )
    return result
  end

    def targets()
    sql = "SELECT * FROM targets WHERE player_id = #{@id}" #selecting every album for the instnace we are working on
    targets = SqlRunner.run( sql ) # this will return an array of hashes, but we want an array of objects since we have a method
    result = targets.map { |target| Target.new( target ) } #remaps every hash to a new album, we shoudl get bak a nice aray of objects
    return result
    end

    def kills() # assumes that we are playing circle
      killtime = Time.now.getutc
      sql = "UPDATE targets set killed_date = '#{killtime}' WHERE (targets.player_id = @id)"
      player = SqlRunner.run( sql ).first 
      #result = Player.new( player )
      return 
    end
    
end
