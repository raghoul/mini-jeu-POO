require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts "------------------------------------------------"
puts "   
ð¤¼ââï¸ð¤¼ââï¸ð¤¼ââï¸ð¤¼ââï¸ð¤¼ââï¸ð¤¼ââï¸ð¤¼ââï¸ð¤¼ââï¸ð¤¼ââï¸ð¤¼ââï¸ð¤¼ââï¸ð¤¼ââï¸ð¤¼ââï¸ð¤¼ââï¸ð¤¼ââï¸ð¤¼ââï¸ð¤¼ââï¸ð¤¼ââï¸ð¤¼ââð¤¼ââï¸ð¤¼ââï¸ð¤¼ââï¸ð¤¼ââï¸ð¤¼ââï¸                                                   
              Binvenue au jeux                      
         'ILS VEULENT TOUS MA POO'                  
   Le but du jeu est d'Ãªtre le dernier survivant !    
                                                   
ð¤¼ââï¸ð¤¼ââï¸ð¤¼ââï¸ð¤¼ââï¸ð¤¼ââï¸ð¤¼ââï¸ð¤¼ââï¸ð¤¼ââï¸ð¤¼ââï¸ð¤¼ââï¸ð¤¼ââï¸ð¤¼ââï¸ð¤¼ââï¸ð¤¼ââï¸ð¤¼ââï¸ð¤¼âð¤¼ââï¸ð¤¼ââï¸ð¤¼ââï¸ð¤¼ââï¸ð¤¼ââï¸ð¤¼ââï¸ð¤¼ââï¸ð¤¼ââï¸"
puts "------------------------------------------------"


puts " crÃ©er ton nom de joueur!! "
print "> "
user_name = gets.chomp
#  demander Ã  l'utilisateur pour crÃ©er le nom de jouer "Human player " 
user = HumanPlayer.new(user_name)
player1 = Player.new("JosÃ©")
player2 = Player.new("Josiane")
# les variables pour dÃ©clarer statut de joeurs 
enemies = []
# la variable enemie est dans une list 
enemies << player1 << player2
# on intÃ©gre joueur 1 et 2  dans la variable enemies 
puts "Binvenue #{user_name}!"
puts ""
puts "Attentiton, vous avez deux enemies arrivent, JosÃ© et Josiane. Ã  l'attaque!!!!"
puts ""
while user.life_points > 0 && player1.life_points > 0 || player2.life_points > 0 do
# tant que le jouer humain  et le joueur 1 ou 2 ont des points de vie supÃ©rieur Ã  0 

  puts " Afficher le statut de joueur"
  user.show_state
  puts ""

  puts "  quel action veux-tu effectuer ?  "
  puts "ð"

  puts "a - cherche une meilleur arme"
  puts "s - cherche Ã  se soigner "
  puts ""

  puts " attaque un joueur en vue !!"
  puts "0 - #{player1.name} a #{player1.life_points} point de vie."
  puts "1 - #{player2.name} a #{player2.life_points} point de vie."
  puts ""
#  ces dÃ©clartions permet de exÃ©cuter les choix de joueur 
  puts "quel est votre choix:"
  print "ð"
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
# dans cette boucle  si les joueurs 1 et 2 ont des points de vie infÃ©rieur ou = Ã  0 
  if player1.life_points <= 0 && player2.life_points <= 0
    # afficher que le jouer human a gangnÃ© 
    puts "|BRAVO!!! tu as gagnÃ©|"
    puts "-------------------"
  elsif user.life_points <= 0
    #sinon  le joueur human a des points de vie infÃ©rieur ou = 0 
    # afficher que le joeur human a perdu 
    puts "ah Dommage, tu as perdu!! "
    puts "-------------------"
  end

binding.pry
