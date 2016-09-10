# Hyphoid

A resource-based mining game set on a grid

The idea for the game is based on some of my favourite computer-based strategy games such as Tribal Wars, Dungeon Keeper, Age of Empires and Civilisation and board games such as Pandemic. The aim is to encompass my passion for ecology with encouraging others to better understanding and appreciating the Earth's ecosystems, especially the role of mycorrhizal fungi. The aim of the game is to build subsoil colonies and mine nutrients from these mycelial hubs, connect with Trees to access normally inaccessible resources and connect all the trees in the forest.

<p align="center">
  <img src="http://images.universityherald.com/data/images/full/5277/mycorrhizal-fungi.jpg" width="700"/>
</p>

# Built using Active Record &amp; Rails

### Player Types ###

- At the start of the game, each player can choose a Fungus-type : Mycorrhizae or Parasite.

# Mycorrhizae

For a Mycorrhizae, the aim of the game is to link together all the trees on the grid. This is achieved by mining resources using Hyphae, collecting enough to produce a Mushroom with a time-stamp on the mushroom to release spores. Released spores will land randomly within a 5x5 grid relative to the mother's original location. Mycelia can connect with Trees by becoming an immediate neighbour (within the 3x3 gridspace surrounding an individual tree). Possible player types include <a href="Strobilomyces strobilaceus">Strobilomyces strobilaceus</a>, "The Old Man of the Woods", with a particular affinity to Oak Trees, providing an increase in resources when associated with Oaks, <a href="https://en.wikipedia.org/wiki/Paxillus_involutus">Paxillus involutus</a>, "Poison Pax", which reduces tree uptake of heavy metals, metabolising Cadmium, Zinc and Copper. These real-life abilities could be built into the game to effectively provide protection from pathogenic fungi.

Players who choose Mycorrhizae can work together to form a long chain and cooperate to share nutrients, send messages to eachother but they cannot share special abilities such as "Protection from Pathogens".

# Parasites

For a Parasite, the aim of the game is to sabotage the Mycorrhizae's attempts to connect with every tree. Parasites can take various forms and can work together through messages to target specific Mycorrhizae. Parasite player types include Tree parasites and Fungi parasites. Fungus parasites such as <a href="">Asterophora parasitica</a> or <a href="https://en.wikipedia.org/wiki/Gomphidius_roseus">Gomphidius roseus</a> directly attack mycelia when their spores land either on or within the 3x3 landscape surrounding the target opponent. Tree parasites such as <a href="">Armillaria Mellea</a> or <a href="Pholiota squarrosa">Pholiota sqarrosa</a> directly attack Trees and act as a drain on Mycorrhizae, hindering their ability to expand and slowly destroying the Trees as permanent resources. They could also expand across the map from host trees using rhizomorphs. This is particularly powerful feature and may possibly way the game in favour of the Parasites. May require restrictions.

# Combat

This is where things start to enter the realm of fantasy.

Combat can occur between a Mycorrhizae and a Parasite either when a Fungus parasite infects a mycorrhizal host, or with the Tree as a battleground. Within the scope of a Tree-based battle, a system needs to be designed to allow for either the Parasite or the Mycorrhizae to be evicted from the Tree after a war of attrition. This could be decided using the turn-based system. If a parasite wins, they are able to draw the remaining nutrients from the tree to produce mushrooms and release further spores.


### Project Requirements ###

GAME GOAL: Mine all the resources OR connect all the trees OR defeat all competitors OR achieve a certain goal cooperatively

1. Build a turn-based game using mycelium/hypha/spores
2. It is based loosely around a concept of Mining/Farming
3. Stores of Carbon, Nitrates, Phosophates, Sugars are available
4. Turn based game OR Live and steady incrementing?
5. Quantity of hyphae increases resource yield
6. Hyphae act as miners. Mycelia are the hub/store of resources. Requests can be made to trees for Sugars in exchange for phosphates or nitrates or lasting relationships such as "Protection from Pathogens"
7. Spores, Mushrooms and Hyphae require resources to produce.
8. The game cannot be won without trading with Trees.
9. Central resource re-population occurs automatically at the start of a turn OR steadily increases across time
10. Mushrooms are purely the vehicle for expanding into new territory, creating new mycelia which act as new mining hubs.

In the long run, a double stack grid system would work. Each "location" contains its own smaller grid for hyphae moving. They can also move between locations if the x-position + y-position allow.

<table>
  <th colspan=3>
    Relationships & Models:
  </th>
  <tr>
    <td>
      Model Name
    </td>
    <td>
      Relationships
    </td>
    <td>
      Accessors/Methods
    </td>
  </tr>
  <tr>
    <td>
      <b>Player</b>
    </td>
    <td>
      has_many :player_sessions<br>
      has_many :mycelia
    </td>
    <td>
      :name
    </td>
  </tr>
  <tr>
    <td>
      <b>PlayerSession</b>    
    </td>
    <td>
      belongs_to :game_session<br>
      belongs_to :player
    </td>
    <td>
    </td>
  </tr>
  <tr>
    <td>
      <b>GameSession</b>
    </td>
    <td>
      has_many :player_sessions<br>
      has_many :locations<br>
      belongs_to :game
    </td>
    <td>
    </td>
  </tr>
  <tr>
    <td>
      <b>Game</b>
    </td>
    <td>
      has_many :player_sessions<br>
    </td>
    <td>
    </td>
  </tr>
  <tr>
    <td>
      <b>Location</b>
    </td>
    <td>
      belongs_to :game_session<br>
      has_one :mycelia<br>
      has_one :tree
    </td>
    <td>
      :x-position<br>
      :y-position
    </td>
  </tr>
  <tr>
    <td>
      <b>Mycelium</b>
    </td>
    <td>
      belongs_to :player<br>
      belongs_to :mother, class_name: "Mycelium", foreign_key: :mother_id, inverse_of: :children<br>
      has_many :children, class_name: "Mycelium", foreign_key: :mother_id, inverse_of: :mother<br>
      has_one :location<br>
      has_many :hypha<br>
      has_many :mushrooms<br>
      has_many :spores, through: :mushrooms<br>
      has_many :requests
    </td>
    <td>
      :carbon<br>
      :sugar<br>
      :proteins<br>
      :nitrates
    </td>
  </tr>
  <tr>
    <td>
      <b>Hyphae</b>
    </td>
    <td>
      belongs_to :mycelium
    </td>
    <td>
    </td>
  </tr>
  <tr>
    <td>
      <b>Mushroom</b>
    </td>
    <td>
      belongs_to :mycelium<br>
      has_many :spores
    </td>
    <td>
    </td>
  </tr>
  <tr>
    <td>
      <b>Tree</b>
    </td>
    <td>
      belongs_to :location<br>
      has_many :requests
    </td>
    <td>
    </td>
  </tr>
  <tr>
    <td>
      <b>Request</b>
    </td>
    <td>
      belongs_to :tree<br>
      belongs_to :mycelium
    </td>
    <td>
    </td>
  </tr>
</table>


## Turn Based Game ##
You start off with a mycelium. Each turn your store of resources in the mycelia can be used to perform certain functions
a) Produce Hyphae
b) Produce Mushrooms
c) (Only if Mushrooms exist) Release Spores --> This cannot happen in the same turn as a Mushroom being produced (and could possibly incur an extra cost?)
d) Send out request to Tree symbiotes --> This request will be fulfilled if the tree is able. Tree's are not-static objects but slowly accrue resources as time passes

To expand into new territory upon release of spores a chance element is introduced, a certain number of new mycelia are formed in a new location. These have no direct connection to the "mothership" but are still controlled by the player. The aim of the game is to connect all the trees in the forest by expanding your mycelia or it could be to send a message or flag or something from tree A to tree B, at either sides of a map. New mycelia are initialised on a random location within a 5x5 grid with original mycelia at the centre.

# Grid based Game

<p align="center">
<img src="https://s-media-cache-ak0.pinimg.com/236x/d7/47/33/d747337b43c19140c993e08d7c88fb50.jpg"/>
</p>


# Variables:

1. Element of chance can be introduced which could determine the likelihood of discovering nutrients
2. Once map-based, resource pockets can be discovered which contain different stores of nutrients. Seek and Replenish attitude.
3. Once a certain number of hyphae are produced a the current mycelium can expand into a neighbouring square on the grid (does this mean producing a second one?)

# Questions:

1. How do we establish a new relationship with a tree instance?
2. Can introduce events which can increase the overall store of the soil?
3. Multilayered grid system as a GOING DEEPER step --> hyphae are tiny.
4. What else to Trees produce and exchange with Fungi?
5. How do we introduce Time as a concept. Are turns a new model?

# Answers

- ON A SMALL SCALE, TURN BASED, RESOURCES ORIGINATE IN THE MYCELIA RELATIVE TO THE AMOUNT OF HYPHAE AND PERCENTAGE CHANCE OF DISCOVERING NUTRIENTS


# Fungi Facts to Integrate

Primary sources of energy / nutrients are Nitrate, glycerol (sugars), ammonia, acetate, & ethanol.
Increases uptake of Phosphates and Nitrates for symbiotes
Can transport carbohydrates between trees
Carbon appeared to be the limiting nutrient for fungal growth in both an agricultural soil and a forest humus soil.
Amatoxins
Bioluminescence and other cool skills
