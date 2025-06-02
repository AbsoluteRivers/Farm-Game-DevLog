# Farm-Game-Devlog


## Day 1 (5/28/2025)

#### Progress
- Following a [farming game tutorial](https://www.youtube.com/watch?v=it0lsREGdmc&list=PLWTXKdBN8RZe3ytf6qdR4g1JRy0j-93v9&ab_channel=RapidVectors) in Godot by [Rapid Vectors](https://www.youtube.com/@rapidvectors)  
- Learned nodes, scenes, and tilemaps  
- Used free assets <a href="https://cupnooble.itch.io/sprout-lands-asset-pack">SproutLands by CupNooble</a> on itch.io  
- Set tilesets onto atlas manually  
- Animated animations for player character and tilemap scene  


## Day 2 (5/29/2025)

#### Progress
- Focused in player character movement  
- Learned node states and node state machine for player character movement  
- Used [script](https://github.com/rapidvectors/tutorial-components-and-scripts/tree/main/tutorials/croptails) of node state and node state machine by [rapidvectors](https://github.com/rapidvectors)  
- Provided keyboard input for movement  
- <i>Included controller support</i>  
- Learned how to use and debug for node states with idle and walk  


## Day 3 (5/30/2025)

#### Progress
- Learning further player state machines for other actions  
- Created script for tools. Listed object tools  
- Created node states for chopping, watering, and tilling animations  
<i>Tip: remember to turn looping in animation off</i>  
- <i>Edited walking script to allow diagonal movement using x and y axis</i>  
- Provided input mapping for hit/interaction  
- Added action script for interaction animation  
- <i>Added cancel action script. Will check if correct usage</i>  
- Learning tilesets and tilemap layers  
- House scene and physics apply on tilesets  
- Created 2 types of houses. Still unsure about physics layers, collision layers, and collision maps  


## Day 4 (5/31/2025)

#### Progress
- Learn how to create custom components that will be interactable; House door  
- <i>Understood deeper about collision layers(where the collision is) and collision mask(what will collide with the collision shape)</i>  
- Using extensible components(if going to use similar actions) to interact with door  
<i>Note: might use extensible components in crops or similar</i>  
- Learn dragging nodes onto script while pressing ctrl will create an onready variable  
- <i>Included collision on edges of ground. Made player collide with edges so water is not accessible.</i>  
- <i>Created object scene using Sprite2d node (rocks, trees)</i>  
- Created hitbox and hurtbox (not yet using fully)  


## Day 5 (6/1/2025)

#### Progress
  - Learn Y-sorting to move behind and infront of objects  
  <i>Tip: if character and tilemap layer is y-sorted, root node should also be y-sorted</i>  
  <i>Tip: adjust y-sorting for each element under select, rendering, and y-sort origin</i>  
  - Learn to create npc animals (chicken) and navigation agent 2d with avoidance and a navigation region 2d to limit movement of NPC  
  - <i>Used idea how to create characters to create chicken npc basics on own. Little scripts, no movement</i>  
  - Learned of Timer method of gdscript (not yet fleshed out, just an introduction)  
  - Learned how to script for npc movement and how to debug the walking animation  
  <i>Tip: using canvas items (Project Settings, Windows, Stretch) along a navigation agent will have improve interpolation (remove bouncing movement/staircase effect). The movement of the agent can be interpolated to create smoother transitions between path points</i>  
  - Learned how npc avoid colliding with each other  
  *<i>Error: multiple NPC(chickens) always head to 1 specific pixel within the navigation region (0,0) before getting random position</i>  
  *<i>Fix: doubled await code on character setup to wait for a random position</i>  
  - Learn randomized walk cycles for npc  

##### Notes:

  - Might create cow NPC tomorrow, apply all learned  



## Day 6 (6/2/2025)

#### Progress
  - <i>Creating cow NPC on own with reusable scripts from chicken NPC</i>  
  *<i>Error: Cow NPC unable to transition to walk, stuck on idle</i>  
  *<i>Fix: did not initialize idle node on parent node so cow doesnt transition</i>  
  - <i>Provided sprint animation for player character</i>  
  - Learned how to make navigation polygon to work with tilemap  
  *<i>Tip: In geometry of NavigationRegion, make source geometry mode group explicit and copy soure geometry name. Paste source geometry name on necessary tilemap(Node, Groups) then bake navigation polygon</i>  
  *<i>Tip: If NavigationRegion exceeds the grouped tilemap, NavigationArea will merge to (0,0). Align the NavigationRegion along the necessary tile edges to prevent this from happening</i>  



