class Player # player est une classe 
  attr_accessor :name, :life_points
# attribu initialize ( instance  )  
  def initialize(name)
    @name = name
    @life_points = 10
  end
  # on affiche le nom de joueur et point de vie 
  def show_state
    puts "#{@name} a #{@life_points} points de vie."
  end
# la methode permet de calculer nombre vie de jouer 
  def gets_damage(damage)
    @life_points = @life_points - damage
# point de vie est = point de vie - les dommages saisi
    if @life_points <= 0
# si les points de vie inférieur ou égal à 0 le joueur est mort 
      puts "le joueur #{@name} a été tué!!"
    end
  end

  def attacks(player)
    puts "#{@name} a attaqué le joueur #{player.name}."
        #  player1 attaque le joueur player2  
    damage_inflicted = compute_damage
    # cette variable permet de calculer nombre de vie perdu par le player 
    player.gets_damage(damage_inflicted)
    # classe player prends la methode  "point de vie - les dommages saisi"
    if player.life_points > 0
     # si le points le jouer a des points de vie  > à O 
    puts "#le joueur #{@name} inflige #{damage_inflicted} points de dommages."
      # affiche le nom de jouer qui donner le nombre de dommage  
    end
  end

  def compute_damage
    return rand(1..6)
  end

end


class HumanPlayer < Player
  attr_accessor :weapon_level

  def initialize(name)
    @name = name
    @life_points = 100
    @weapon_level = 1
  end

  def show_state
    puts "#{@name} a #{@life_points} point de vie et niveau d'arme #{@weapon_level}."
  end

  def compute_damage
    return rand(1..6) * @weapon_level
  end

  def search_weapon
     # cette methode permet de trouver l'arme 
    weapon_found = rand(1..6)
    # cette variable permet trouver une arme aléatoirment de niveau entre 1 à 6 
    puts "tu a trouvé le niveau d'arme #{weapon_found}"
    # si le niveau d'arme trouvé superieur au niveau 1  "@weapon_level = 1" 
    if weapon_found > @weapon_level
     # alors niveau d'arme 1 est = niveau d'arme trouvé
        @weapon_level = weapon_found
      puts "super , tu as une armé mieux et prends le !!"
    else
     #sinon affiche le messgae ( aléatoirment il tombe sur 1)   
        puts "M@*#$... elle n'est pas mieux que ton arme actuelle...!!"
    end
  end

  def search_health_pack
     # cette methode permet de trouver un pack de points de vie
    health_pack_found = rand(1..6)
    # cette variable permet trouver un pack de points de vie  aléatoirment 1à 6
    puts health_pack_found
        # si le pack de point de vie est égale à 1 
    if health_pack_found == 1
      puts "tu as rien touver comme point de vie"
      # sinon  pack de point de vie est supérieur à 1 et pack de point de vie inférieur à 6 
    elsif health_pack_found > 1 && health_pack_found < 6
      puts "Bravo, tu as trouvé un pack de +50 points de vie."
      if @life_points <= 50
        @life_points = @life_points + 50
      else
        @life_points = @life_points + 50 - (@life_points - 50)
      end
         # si le résultat de le pack de point de vie tombe entre 2 et 5 
      # cette boucle augementer 50 point de vie 
    else
      puts "Wooow!! tu as trouvé 80 point de vie"
        @life_points = @life_points + 80
        if @life_points > 100
          @life_points = @life_points + (100 - @life_points)
          # si le résultat de le pack de point de vie tombe est = 6 
          # cette boucle  augementer 100 point de vie 
        end
    end
  end

end