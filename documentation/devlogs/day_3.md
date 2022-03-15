## How did Day 3 go?

Day 3 of development on the jam was relatively short as I work full time allowing only a couple of hours in the evening.

## Writing up those docs

I started by writing up the retrospective of Day 2, while this slows me down on progress on this project I hope that it will be useful on projects going forwards.

## Next on the list

With the short amount of time that I had to implement the next MVP I skipped doing any clean-up from Days 1 and 2 and moved onto the next item listed simply as ‘Robot’.

The initial adding of the animations and setting up the collision was quick as this was just repeating the steps from Day 1 for a new entity. The coding wasn’t as simple as the robot would need to move based on the player’s proximity to itself.

> I have to end the day with a snail pace robot

Setting up the player detection was relatively simple using an [Area2D](https://docs.godotengine.org/en/stable/classes/class_area2d.html) but I was unable to get the robot’s movement complete. While the walk animation was firing and the robot was moving towards the player it was almost unnoticeable. My current lack of understanding on how `delta` and [move_and_slide](https://docs.godotengine.org/en/stable/tutorials/physics/physics_introduction.html#move-and-slide) works was my downfall here and I have to end the day with a snail pace robot.

## Summary
Overall the day didn't go as well as I wanted but I did make a little progress.