# plants

## Plants Game overview

Forked from my [Alchemy game](https://github.com/kramff/alchemist) to re-use the rollback netcode system I built for that project.

Possible names:

"Plants Game"

"Dungeon Farmer"

Concept: A dungeon where everything is a plant, from your equipment and weapons, to the enemies and even the dungeon itself! You must survive by cross-breeding the plants you find for unique results.

Game format: Co-op rogue-like where you start over after losing a run, similar to Plate Up, Spelunky, or Risk of Rain. Some far-off goal that is possible but difficult.

Game structure: Alternate between a "defend your farm/base" section and an exploration/expansion section. Not sure how enforced that dynamic will be.

## Design goals:

Combat should be fun and engaging, not just "stat checks".
There should be a "stagger bar" in addition to HP, with various responses from different enemies.
For example, one enemy type may get stunned upon the stagger bar filling up, but "angrily" counter attack after the stun wears off.
Another enemy may take more damage when close to a certain amount on their stagger bar, so you want to keep their bar around that level.

The different weapon types should have a couple different ways to interact with the "stagger bar".
For example, a simple weapon may have a quick attack that doesn't add much to the stagger bar, and a slow attack that adds more to the bar.
More complicated weapons might have attacks that reduce the bar, do more damage on certain conditions, or anything else interesting.

The plant breeding system should be interesting and deep, but simple enough to use for beginners.
Ideally any plant could cross breed with any other plant, so you could get the traits of both combined in an interesting way.
I would like to have these categories of things be plants:
- Weapons: vine whip, wooden sword, pea shooter, thorn dagger
- Armor: 
- Equipment: Tools to help move around the dungeon, or interact with plants, or whatever else
- Consumable Items: Healing potions and food, items to help grow plants better and faster, combat items
- Monsters: grow your own enemies for whatever reason. Maybe you want a certain trait from an enemy you encounter, or you can try to breed a monster that helps you instead of hurting you.
- Bosses: you could breed a more powerful boss to battle and get better rewards from defeating it
- Critters: may help or harm you. I would like to see "bees" that help pollinate other plants for you.
- Locations: new sections of the dungeon to explore and potentially move your base to.

Plants should have a semi-realistic growing system, where they need sunlight, soil nutrients, and water in order to reach their full potential.

Cross breeding: make a pseudo-genetics system. Various genes can be on or off.
A group of genes can come together to create a weighted value that determines if the trait is expressed or not, and to what degree.
For example maybe there would be 10 genes that determine how high a plant grows.
If they are all off, the plant would be tiny, and if they are all on, the plant would be huge.
Cross breeding these two plants would result in a plant with some of the 10 genes turned on and some turned off.
This would cause the child plant to be somewhere in the middle of the two sizes.
Resulting size could be something like `# of active growth genes * 1 meter`, but maybe the different genes have somewhat different effects.

Plant size and other traits shouldn't just be "okay it got enough sunlight, nutrients, and water so it grows to the calculated size".
Instead it should be more of a dynamic system where the calculated trait value influence how it chooses to spend resources.

Could do dominant and recessive genes.

All the plants in this dungeon are considered the same species and have access to the same set of genes, to allow for crossbreeding.
While I think occasional random mutation would be interesting, it would have to be unlikely to cause game-breaking results.

Some potential traits:
- Roots: How wide do the roots spread? What kind of nutrients is it good at drawing from the soil? How much water does it pull? Any special properties of the roots?
- Body: How sturdy is the stem/trunk? How tall does it try to grow (assuming it gets enough nutrients / energy)? Any special properties? Suitable as building material, as a weapon, other uses? Thorns? Sap?
- Branches: How many branches does it try to make? How long are the branches?
- Leaves: How big are the leaves? What shape are they? How dense or spare are they? What color? Are the leaves useful in some way?
- Flowers: What color? What shape? 
- Seeds: How are they dispersed (wind, fruit, ride critters)? Are the seeds useful as ammo, food, or anything else?
- Fruit: Edible? Effects when eaten? How large? Color, shape?
- Other products: Plants in this game can create a large variety of other products, like weapons, equipment, monsters, critters, and new areas. I haven't fully thought out how cross breeding plants that make different products would work but it should make sense and be satisfying to figure out.

I would like to have the "funny cascading failure" vibe that you get from Spelunky.
- Enemies that get vastly stronger upon defeating a player
- Chain reactions of some kind? Not sure

There should be some kind of mental tug of war between staying where you are and moving on to a new location. Being able to take a section of your farm/base with you would be great.
- Invading enemies slowly growing more powerful
- Increasing rewards from growing better plants in a single spot

There should be long-term strategy about the path you take through the dungeon, so there should be "hints" of some kind about what options are available coming up.
- Scout for new locations in between enemy raids

There should be "push your luck" mechanics where you can take on a large risk in hopes of getting a bigger reward.
- Intentionally maximise the "power" of a boss that you yourself are growing (by using fertilizer, watering with hard-earned enemy blood, etc) so that you can get a bigger prize when you defeat it


Multiplayer: with rollback netcode there is probably a reasonable limit to the maximum player count but not sure what that is. The goal would be at least 4 players comfortably playing together, more than that would be great.

---

## Running the server

To run the websocket server:

In Server/

> node server.js

(Connects to ws port 8077)

## Hosting the website locally

To host the website files:

In Game/

> npx vite --port 8070

(Can use any port besides 8077)

## Viewing the game locally

View locally at:

http://localhost:8070/index.html

(or whatever port you picked in the last step)

## Building for web

Vite doesn't work over the internet. To build for web hosting:

In Game/

> npx vite build

Then, copy the Game/models/ folder into Game/dist/

- [ ] TODO: Have that happen automatically

The Game/dist/ folder is what should be put into the web server

- [ ] TODO: Make that transfer easier so I don't have to fiddle with dragging files around so much.

---

## Libraries, tools, other resources

This project uses [Three.js](https://threejs.org/) for 3d rendering.

This project uses [javascript module syntax](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Modules) so that it can use [three.js](https://threejs.org/)'s [GLTF Loader](https://threejs.org/docs/index.html#examples/en/loaders/GLTFLoader).

This project uses [Vite](https://vitejs.dev/) for building/bundling the javascript modules. [(Following this page's recommendations)](https://threejs.org/docs/#manual/en/introduction/Installation)

The server is using the [ws library](https://github.com/websockets/ws) so it can connect to the game page's websockets.

---

## Other Notes

It has been harder to inspect and debug the game since moving to javascript module syntax. Not having global access to the modularized game state variables is tricky.

To help, I created a "Hit Breakpoint" button that just hits a `debugger;` statement. However, this can't be used to inspect with the console while the game is running.

- [ ] TODO: Try putting `currentGameState` and other important variables into global scope using this approach: [stack overflow link](https://stackoverflow.com/questions/74509829/how-to-debug-javascript-modules-using-the-browser-console)

