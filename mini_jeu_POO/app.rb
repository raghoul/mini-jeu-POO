require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts "--------------------" 
puts " |Bienvenue sur 'ILS VEULENT TOUS MA POO' !| "
puts " |Le but du jeu est d'être le dernier survivant !| "
puts "--------------------" 


player1 = Player.new ("Josiane") 
player2 = Player.new ("José") 

puts "Voici les états de nos jouers"
player1.show_state
player2.show_state 
puts " "

while player1.life_points > 0 && player2.life_points > 0 do
    # quand le jouer 1 a des points de vie > à 0 et le jouer 2 a des points de vie > à 0 
    puts "Passons à la phase d'attaque !! "
    player1.attacks(player2)
    # joueur 1 attack jouer 2 
    break if player2.life_points <= 0
    # interompre si le jouer 2 a des points de vie < ou = à 0 
    player2.attacks(player1)
    # en suite joueur 2 attack jouer 1
     puts "-----------------------------------------"
  puts "-----------------------------------------" # c'est pour insérer des lignes 
  puts "Voici les état de nos joueurs"
  player1.show_state
  player2.show_state
  puts "-----------------------------------------"
  puts "-----------------------------------------"
end


binding.pry
