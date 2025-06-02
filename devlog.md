### Farm-Game-Devlog

  <h1></h1>
<h2>Day 1</h2>
<p>
- Following a <a href ="https://www.youtube.com/watch?v=it0lsREGdmc&list=PLWTXKdBN8RZe3ytf6qdR4g1JRy0j-93v9&ab_channel=RapidVectors">farming game tutorial in Godot</a> by <a href="https://www.youtube.com/@rapidvectors">Rapid Vectors</a><br>
- Learned nodes, scenes, and tilemaps<br>
- Used free assets <a href="https://cupnooble.itch.io/sprout-lands-asset-pack">SproutLands by CupNooble</a> on itch.io<br>
- Set tilesets onto atlas manually<br>
- Animated animations for player character and tilemap scene</p>
<br>

<h2>Day 2</h2>
<p>- Focused in player character movement<br>
- Learned node states and node state machine for player character movement<br>
- Used <a href="https://github.com/rapidvectors/tutorial-components-and-scripts/tree/main/tutorials/croptails">script</a> of node state and node state machine by <a href="https://github.com/rapidvectors">rapidvectors</a><br>
- Provided keyboard input for movement<br>
- <i>Included controller support</i><br>
- Learned how to use and debug for node states with idle and walk</p>

<br>
<h2>Day 3</h2>
<p>- Learning further player state machines for other actions<br>
- Created script for tools. Listed object tools<br>
- Created node states for chopping, watering, and tilling animations<br>
<i>  Tip: remember to turn looping in animation off</i><br>
- <i>Edited walking script to allow diagonal movement using x and y axis</i><br>
- Provided input mapping for hit/interaction<br>
- Added action script for interaction animation<br>
- <i>Added cancel action script. Will check if correct usage</i><br>
- Learning tilesets and tilemap layers<br>
- House scene and physics apply on tilesets<br>
- Created 2 types of houses. Still unsure about physics layers, collision layers, and collision maps</p>
<br>

<h2>Day 4</h2>
<p>- Learn how to create custom components that will be interactable; House door<br>
- <i>Understood deeper about collision layers(where the collision is) and collision mask(what will collide with the collision shape)</i><br>
- Using extensible components(if going to use similar actions) to interact with door<br>
<i>Note: might use extensible components in crops or similar</i><br>
- Learn dragging nodes onto script while pressing ctrl will create an onready variable<br>
- <i>Included collision on edges of ground. Made player collide with edges so water is not accessible.</i><br>
- <i>Created object scene using Sprite2d node (rocks, trees)</i><br>
- Created hitbox and hurtbox (not yet using fully)<br></p>

<br>
<h2>Day 5</h2>
<p>
  - Learn Y-sorting to move behind and infront of objects<br>
  <i>Tip: if character and tilemap layer is y-sorted, root node should also be y-sorted</i><br>
  <i>Tip: adjust y-sorting for each element under select, rendering, and y-sort origin</i><br>
  - Learn to create npc animals (chicken) and navigation agent 2d with avoidance and a navigation region 2d to limit movement of NPC<br>
  - <i>Used idea how to create characters to create chicken npc basics on own. Little scripts, no movement</i><br>
  - Learned of Timer method of gdscript (not yet fleshed out, just an introduction)<br>
  - Learned how to script for npc movement and how to debug the walking animation<br>
  <i>Tip: using canvas items (Project Settings, Windows, Stretch) along a navigation agent will have improve interpolation (remove bouncing movement/staircase effect). The movement of the agent can be interpolated to create smoother transitions between path points</i><br>
  - Learned how npc avoid colliding with each other<br>
  *<i>Error: multiple NPC(chickens) always head to 1 specific pixel within the navigation region (0,0) before getting random position</i><br>
  *<i>Fix: doubled await code on character setup to wait for a random position</i><br>
  - Learn randomized walk cycles for npc<br>
</p>
<h5>Notes:</h5>
<p>
  - Might create cow NPC tomorrow, apply all learned<br>
</p>

<br>
<h2>Day 6</h2>
<p>
  - <i>Creating cow NPC on own with reusable scripts from chicken NPC</i> <br>
   *<i>Error: Cow NPC unable to transition to walk, stuck on idle</i><br>
  *<i>Fix: did not initialize idle node on parent node so cow doesnt transition</i><br>
  - <i>Provided sprint animation for player character</i> <br>
  - Learned how to make navigation polygon to work with tilemap<br>
  *<i>Tip: In geometry of NavigationRegion, make source geometry mode group explicit and copy soure geometry name. Paste source geometry name on necessary tilemap(Node, Groups) then bake navigation polygon</i><br>
  *<i>Tip: If NavigationRegion exceeds the grouped tilemap, NavigationArea will merge to (0,0). Align the NavigationRegion along the necessary tile edges to prevent this from happening</i><br>
</p>


