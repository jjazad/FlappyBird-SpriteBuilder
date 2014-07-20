#import "GamePlayScene.h"
#import "Character.h"
#import "Obstacle.h"


Obstacle *obstacle;
@implementation GamePlayScene


- (void)initialize
{
    // your code here

    character = (Character*)[CCBReader load:@"Character"];
    [physicisNode addChild:character];

    [self addObstacle];
    timeSinceObstacle = 0.0f;
}






-(void)update:(CCTime)delta
{
    // put update code here
        // Increment the time since the last obstacle was added
    timeSinceObstacle += delta; // delta is approximately 1/60th of a second

        // Check to see if two seconds have passed
    if (timeSinceObstacle > 2.0f)
    {
            // Add a new obstacle
        [self addObstacle];

            // Then reset the timer.
        timeSinceObstacle = 0.0f;
    }

}

// put new methods here


-(void)touchBegan:(UITouch *)touch withEvent:(UIEvent *)event {

        // This method will be called everytime a player touches the screen.


        //  [character flap];
}

-(void) addObstacle {

    }
-(void) showScore {
    
}

@end
