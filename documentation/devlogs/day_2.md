## How did Day 2 go?

Overall I think *Day 2* went well, I tidied up some bits from [Day 1](https://speedylom.itch.io/hueorph/devlog/357385/day-1) that I wasn't happy with and added some more core functionality.

## Tiding up Day 1

The first thing that I wanted to fix was some gaps that I had in my TileSet that were visible when moving. This was a relatively easy thing to clean up (although a little time consuming) as some of the tiles were a couple of pixels bigger than they should have been. Tweaking the height or width of the region on the sprite sheet fixed these.

> the gravity was really broken

Following that I wanted to fix the movement code of the player as the gravity was really broken with hard to climb to slopes and almost non-existent falling.

After spending just over half an hour trying to tweak various parts of the code I gave up and started again. I cross referenced a few various examples of basic movement code (some from the [Godot Docs](docs.godotengine.org/) and replaced the original with something that felt a lot smoother and behaves as I would expect.

## Continuing with the MVP

Once I had fixed those two issues I moved onto the big ticket item for the day, titled simply as **Changer** in the list. What I wanted to achieve for this was my interpretation of jam's theme *Combine*, to allow Hueorph to combine with a colour to change shape and powers.

I wanted to tackle this next simply because if I couldn't work out how to implement this mechanic then the project would be dead. I think it is best to get some of the more complicated items done first to highlight any potential problems sooner.

The idea was simple, create an item that Hueorph could touch to change colour. I knew I would need a [Signal](https://docs.godotengine.org/en/stable/getting_started/step_by_step/signals.html) for this but it took me a long time to grasp which way round I needed to set it up.

> I was 2/2 on rage quits!

The issue I was facing was passing the signal up to the parent node from an instance of the *changer* back down to the player. This caused me my second rage quit of the project, I was 2/2 on rage quits!

I wouldn't return until after lunch but managed to work through a combination of a couple of tutorials and a handful of posts to determine how I needed it set up for my use case.

```gdscript
# Changer.gd
onready var _hueorph = get_parent().get_node('Hueorph')
...
_hueorph.emit_signal("combine", colour, hexadecimal)
```

```gdscript
# Hueorph.gd
signal combine(colour)
```

> I added a little *poof*

After fixing my issues with `signal` I added a little *poof* effect to make it more obvious that something was happening. I really enjoyed adding this as it was simple to implement but provides good feedback for the player.

## Documentation
I took a break after the victory with the `signal` and went about setting up the [game page](https://speedylom.itch.io/hueorph) on itch.io and writing the [first retrospective](https://speedylom.itch.io/hueorph/devlog/357385/day-1).

I thought it was important to document the process not only for anyone who might be interested but for myself also so that I can look back and see the progress that I have made and how it came about.

## More tidy up
Once I had written up the first devlog and made some posts to the socials I carried on with some more tidy up.

During some play tests I noticed that I was missing some more tiles from the TileSet, so I went back and added those in. Next time I'll make sure to take more care and time setting up the TileSet in the future.

## Drawing to a close
With it getting late in the day at this point and having work early in the morning I wanted to add a little something extra to show on the socials.

I added one of the special abilities of a higher jump for the green version as this was just a case of making the jump bigger when Hueorph's colour is green.

## Summary
Looking back Day 2 went better than Day 1 with me feeling more comfortable working with Godot in general.

Although there was a minor hiccup and another rage quit I completed everything I wanted to achieve on the second day.

I finished Day 2 feeling optimistic about having something to submit by the end of the jam.

