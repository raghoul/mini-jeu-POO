require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts "------------------------------------------------"
puts "   
🤼‍♂️🤼‍♂️🤼‍♂️🤼‍♂️🤼‍♂️🤼‍♂️🤼‍♂️🤼‍♂️🤼‍♂️🤼‍♂️🤼‍♂️🤼‍♂️🤼‍♂️🤼‍♂️🤼‍♂️🤼‍♂️🤼‍♂️🤼‍♂️🤼‍♂🤼‍♂️🤼‍♂️🤼‍♂️🤼‍♂️🤼‍♂️                                                   
              Binvenue au jeux                      
         'ILS VEULENT TOUS MA POO'                  
   Le but du jeu est d'être le dernier survivant !    
                                                   
🤼‍♂️🤼‍♂️🤼‍♂️🤼‍♂️🤼‍♂️🤼‍♂️🤼‍♂️🤼‍♂️🤼‍♂️🤼‍♂️🤼‍♂️🤼‍♂️🤼‍♂️🤼‍♂️🤼‍♂️🤼‍🤼‍♂️🤼‍♂️🤼‍♂️🤼‍♂️🤼‍♂️🤼‍♂️🤼‍♂️🤼‍♂️"
puts "------------------------------------------------"


puts " créer ton nom de joueur!! "
print "> "
user_name = gets.chomp
#  demander à l'utilisateur pour créer le nom de jouer "Human player " 
user = HumanPlayer.new(user_name)
player1 = Player.new("José")
player2 = Player.new("Josiane")
# les variables pour déclarer statut de joeurs 
enemies = []
# la variable enemie est dans une list 
enemies << player1 << player2
# on intégre joueur 1 et 2  dans la variable enemies 
puts "Binvenue #{user_name}!"
puts ""
puts "Attentiton, vous avez deux enemies arrivent, José et Josiane. à l'attaque!!!!"
puts ""
while user.life_points > 0 && player1.life_points > 0 || player2.life_points > 0 do
# tant que le jouer humain  et le joueur 1 ou 2 ont des points de vie supérieur à 0 

  puts " Afficher le statut de joueur"
  user.show_state
  puts ""

  puts "  quel action veux-tu effectuer ?  "
  puts "😊"

  puts "a - cherche une meilleur arme"
  puts "s - cherche à se soigner "
  puts ""

  puts " attaque un joueur en vue !!"
  puts "0 - #{player1.name} a #{player1.life_points} point de vie."
  puts "1 - #{player2.name} a #{player2.life_points} point de vie."
  puts ""
#  ces déclartions permet de exécuter les choix de joueur 
  puts "quel est votre choix:"
  print "😊"
  user_input = gets.chomp

  if user_input == "a"
    user.search_weapon
  elsif user_input == "s"
    user.search_health_pack
  elsif user_input == "0"
    user.attacks(player1)
  elsif user_input == "1"
    user.attacks(player2)
  end

  puts "partie est tous jours en cours: "
# cette boucle va se lancer chaque fois si le joueur 1 et2 ont des points d vie supeur a 0 
# et les joeurs 1 ou 2  attaques jouers human 
  enemies.each do |player|
    if player.life_points > 0
      player.attacks(user)
    end
  end

end

puts ""
puts "-------------------"
puts "|Voici le resultat de la partie!!!.|"
# dans cette boucle  si les joueurs 1 et 2 ont des points de vie inférieur ou = à 0 
  if player1.life_points <= 0 && player2.life_points <= 0
    # afficher que le jouer human a gangné 
    puts "|BRAVO!!! tu as gagné|"
    puts "-------------------"
  elsif user.life_points <= 0
    #sinon  le joueur human a des points de vie inférieur ou = 0 
    # afficher que le joeur human a perdu 
    puts "ah Dommage, tu as perdu!! "
    puts "-------------------"
  end

binding.pry
