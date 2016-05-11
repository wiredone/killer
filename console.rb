#!/Users/user/.rbenv/shims/ruby
require_relative( './models/player' )
require_relative( './models/target' )
require ( 'pg')
require( 'pry-byebug')

player1 = Player.new( { 'name' => 'Keith' } ).save() # this is great
player2 = Player.new( { 'name' => 'Beth' } ).save() # this is great
player2 = Player.new( { 'name' => 'Kat' } ).save() # this is great
player2 = Player.new( { 'name' => 'Valerie' } ).save() # this is great
player2 = Player.new( { 'name' => 'Sandy' } ).save() # this is great
player2 = Player.new( { 'name' => 'Jay' } ).save() # this is great
player2 = Player.new( { 'name' => 'Emily' } ).save() # this is great
player2 = Player.new( { 'name' => 'Zsolt' } ).save() # this is great
player2 = Player.new( { 'name' => 'Shona' } ).save() # this is great
player2 = Player.new( { 'name' => 'Leigh-Anne' } ).save() # this is great
player2 = Player.new( { 'name' => 'Harvey' } ).save() # this is great
target1 = Target.new( { 'name' => 'Rick' , 'player_id' => player1.id } ).save()

binding.pry
nil
