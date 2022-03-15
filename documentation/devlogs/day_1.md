Hello everyone, I'm Speedy!

This post is look back at my first day of development on "Hueorph" my entry (hopefully) into [Godot Wild Jam #43](https://itch.io/jam/godot-wild-jam-43).

## Why am I doing the jam?
Since my early teens I have wanted to create my own game but I haven't ever made anything past playing around in the engines.

I have attempted to start a few games within the last year but I haven't ever made it past the first few days without losing interest.

I think this is mostly because the scope of the game I wanted to make was too large and I couldn't work out where to start.

I'm hoping the jam will help me to limit my scope because of the hard deadline and allow me to make some progress.

## Day one, how it went
For me the jam started late evening on a Friday so my first day was Saturday.

With a rough idea of what I wanted to make I hopped over to [Kenney.nl](https://kenney.nl/assets) to get some free assets, creating my own artwork would be too much for the short length of the jam.

After acquiring some assets, I created the repository on [GitHub](https://github.com/SpeedyLom/hueorph) and cloned it onto my PC.

> the dreaded blank editor

Then I moved onto the dreaded blank editor! It was then that I realised that I couldn't remember anything from the tutorials I had worked through months ago.

With my **doom** pending I worked on a MVP (minimum viable product) list so I could focus on only the important tasks, tackling the project in manageable chunks.

The top item on my list was 'Player', I started with a new [KinematicBody2D](https://docs.godotengine.org/en/stable/classes/class_kinematicbody2d.html#), set a [collision shape](https://docs.godotengine.org/en/stable/classes/class_collisionshape2d.html) and added an [animated sprite](https://docs.godotengine.org/en/stable/classes/class_animatedsprite.html).

I then spent too much time trying to code elegant code but the movement was slow and the gravity didn't work.

> I rage quit...swearing never to return!

Not wanting to quit I moved onto the second item on my list 'Level'. This is where I fell down, I couldn't work out how to create a [Tilemap](https://docs.godotengine.org/en/stable/classes/class_tilemap.html), I rage quit and went about my day swearing never to return!

After resting and spending time with the family I came back with renewed determination. I found some more tutorials and it was actually quite easy to get the pesky Tilemap created.

After plopping down some tiles from my new [TileSet](https://docs.godotengine.org/en/stable/classes/class_tileset.html#class-tileset) I wanted to cover up the grey with a fancy background.

Luckily this was a snap, by setting a [Camera2D](https://docs.godotengine.org/en/stable/classes/class_camera2d.html) as node of the player and adding a [ParallaxBackground](https://docs.godotengine.org/en/stable/classes/class_parallaxbackground.html) to my level a fancy background was added in minutes.


It was getting late in the day at this point and I made enough of a level to make a small progress video, so I committed and called it a day.

## Success or failure
Overall I chalked 'Day 1' as a success, I had something rudimentary but it looked like the start of a game.

> maybe, just maybe I can do this

This small victory has led me to believe that "maybe, just maybe I can do this". 

Hopefully, day 1 is a sign of things to come, small but meaningful progress with only a little bit of rage quitting.