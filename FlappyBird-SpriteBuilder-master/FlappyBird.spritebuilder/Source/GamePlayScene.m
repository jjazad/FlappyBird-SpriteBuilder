#import "GamePlayScene.h"
#import "Character.h"
#import "Obstacle.h"

@implementation GamePlayScene

- (void)initialize
{
    // your code here

    character = (Character*)[CCBReader load:@"Character"];
    [physicisNode addChild:character];
}

-(void)update:(CCTime)delta
{
    // put update code here


}

// put new methods here


-(void)touchBegan:(UITouch *)touch withEvent:(UIEvent *)event {

        // This method will be called everytime a player touches the screen.

    [character flap];
}


-(void) addObstacle {
    

}


-(void) showScore {

}

@end
