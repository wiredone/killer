require( 'pg' )
require_relative( '../db/sql_runner' )
require_relative( 'target' )


class Player

  attr_accessor( :id, :name, )

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

#    def kills() # assumes that we are playing circle
#      killtime = Time.now.getutc
#      sql = "UPDATE targets set killed_date = '#{killtime}' WHERE (targets.player_id = @id)"
#      player = SqlRunner.run( sql ).first
 #     sql = "Delete from players where player@id =
      #result = Player.new( player )
#      return 
   # end



    
end


    def list_players()
      sql = "select * from players"
      list_of_players = SqlRunner.run( sql)
  #    result = list_of_players
      array_of_h = list_of_players.map { |player| Player.new( player ) }
          result =""
      for ob in array_of_h
    
        result << " Player #{ob.id}  #{ob.name}
"
      end
      result << "Total Players #{array_of_h.size}"
      return result
    end

    def list_targets()
      sql = "select * from targets"
      list_of_targets = SqlRunner.run( sql)
  #    result = list_of_players
      array_of_h = list_of_targets.map { |target| Target.new( target ) }
          result =""
      for ob in array_of_h
    
        result << " Player #{ob.id}  #{ob.name} #{ob.killed_date}
"
      end
      result << "Total Targets #{array_of_h.size}"
      return result
    end

    def killed(player) # assumes that we are playing circle
      killtime = Time.now.getutc
      sql = "UPDATE targets set killed_date = '#{killtime}' WHERE (targets.player_id = player)"
#      player = SqlRunner.run( sql ).first
 #     sql = "Delete from players where player@id =
      #result = Player.new( player )
      return 
    end


