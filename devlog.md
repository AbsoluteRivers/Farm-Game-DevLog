# **Farm-Game-Devlog**


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
- *Included controller support*  
- Learned how to use and debug for node states with idle and walk  


## Day 3 (5/30/2025)

#### Progress
- Learning further player state machines for other actions  
- Created script for tools. Listed object tools  
- Created node states for chopping, watering, and tilling animations  
*Tip: remember to turn looping in animation off*  
- *Edited walking script to allow diagonal movement using x and y axis*  
- Provided input mapping for hit/interaction  
- Added action script for interaction animation  
- *Added cancel action script. Will check if correct usage*  
- Learning tilesets and tilemap layers  
- House scene and physics apply on tilesets  
- Created 2 types of houses. Still unsure about physics layers, collision layers, and collision maps  


## Day 4 (5/31/2025)

#### Progress
- Learn how to create custom components that will be interactable; House door  
- *Understood deeper about collision layers(where the collision is) and collision mask(what will collide with the collision shape)*  
- Using extensible components(if going to use similar actions) to interact with door  
*Note: might use extensible components in crops or similar*  
- Learn dragging nodes onto script while pressing ctrl will create an onready variable  
- *Included collision on edges of ground. Made player collide with edges so water is not accessible.*  
- *Created object scene using Sprite2d node (rocks, trees)*  
- Created hitbox and hurtbox (not yet using fully)  


## Day 5 (6/1/2025)

#### Progress
  - Learn Y-sorting to move behind and infront of objects  
  *Tip: if character and tilemap layer is y-sorted, root node should also be y-sorted*  
  *Tip: adjust y-sorting for each element under select, rendering, and y-sort origin*  
  - Learn to create npc animals (chicken) and navigation agent 2d with avoidance and a navigation region 2d to limit movement of NPC  
  - *Used idea how to create characters to create chicken npc basics on own. Little scripts, no movement*  
  - Learned of Timer method of gdscript (not yet fleshed out, just an introduction)  
  - Learned how to script for npc movement and how to debug the walking animation  
  *Tip: using canvas items (Project Settings, Windows, Stretch) along a navigation agent will have improve interpolation (remove bouncing movement/staircase effect). The movement of the agent can be interpolated to create smoother transitions between path points*  
  - Learned how npc avoid colliding with each other  
  *Error: multiple NPC(chickens) always head to 1 specific pixel within the navigation region (0,0) before getting random position*  
  *Fix: doubled await code on character setup to wait for a random position*  
  - Learn randomized walk cycles for npc  

##### Notes:

  - Might create cow NPC tomorrow, apply all learned  



## Day 6 (6/2/2025)

#### Progress
  - <i>Creating cow NPC on own with reusable scripts from chicken NPC</i>  
  *Error: Cow NPC unable to transition to walk, stuck on idle*  
  *Fix: did not initialize idle node on parent node so cow doesnt transition*  
  - <i>Provided sprint animation for player character</i>  
  - Learned how to make navigation polygon to work with tilemap  
  *Tip: In geometry of NavigationRegion, make source geometry mode group explicit and copy soure geometry name. Paste source geometry name on necessary tilemap(Node, Groups) then bake navigation polygon*  
  *Tip: If NavigationRegion exceeds the grouped tilemap, NavigationArea will merge to (0,0). Align the NavigationRegion along the necessary tile edges to prevent this from happening*  


## Day 7 (6/3/2025)  

### Progress  
  - Learned UI integration for tools panel  
  - Learned StyleClasses/StyleResources to make different styles for the same type of control control  
    *Tip: this makes different styles for a button or panel*  
    *Error: unable to find region tab on NewAtlasTexture to edit region*  
    *Fix: Somehow worked out, it fixed itself when the NewAtlasTexture was reloaded*  
    *Note: will apply different UI type later on*


## Day 8 (6/4/2025)  

### Progress  
  - Continue with learning UI integration *(actually restarted from start of UI learning)*  
    *Error: margins don't autoset at the button region so button texture is not visible*  
    *Fix: forgot to set custom minumum size x and y of button*  
  - Upon revisiting, undewrstood the UI better and more clearly  
  - *Included an unarmed slot*  
    *Note: Might use the unarmed slot for holding materials*  
    *Note: Made a diagonal UI box. Will edit graphics to match the aesthetic soon*  
  - Learned the game overlay UI to implement the tools UI  
  - Made a tools_manager script and made it global  
  - *Applying a fix to animation wherein animation won't hit if mouse hovers on tool panel UI*  
  - *Figured out a script to identify if UI is hovered/entered by mouse*  
    *Bug: Still unable to fix the animation. Will get back in the future*


## Day 9 (6/5/2024)  


### Progress
  - Learned how to make collectible items using collectible components  
  - *Used idea of collectible components to provide an area that attracts the collectible towards the player*  
    *Note: Will come back to that idea soon*  
  - Learned inventory UI for collected materials
  - *Made inventory UI closable*  


## Day 10 (6/6/2024)


### Progress
  - Continued inventory UI costumizable  
    *Tip: Don't forget to put the string name for the collectable_name under collectable_component*   
  - Learned a global inventory script. *Will implement on the collapsable inventory soon*  
    *Tip: Don't use elif when separately checking as it will check the first argument first and will not consider the other elif statements*  
  - Learned about Day-Night Cycles  
  - Created a Day-Night global script  
    *Note: Replaced one button as next day button but not yet working*  
    *Note: Cannot grab focus of 2 buttons at the same time*  


## Day 11 (6/7/2024)


### Progress
  - Learned how to create farming crops  
  - Created growth cycle component and updated data_types global script with enums for growth cycle  
  - Provided script on corn node to access growth cycle component and hurt components  
    *Tip: Don't forget to put the hit component on the relative node or "tool" to activate hurt component, else script won't work*  
    *Tip: Watch the position of commands in function carefully*  
    *Bug: Visual bug on crop, stuck on seed*  
    *Fix: Changed the data to match seedling*  
    *Bug: Hit component missing scripts*  
