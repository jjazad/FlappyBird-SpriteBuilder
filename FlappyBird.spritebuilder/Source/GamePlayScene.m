#import "GamePlayScene.h"
#import "Character.h"
#import "Obstacle.h"

@implementation GamePlayScene

{

    CCNode *_ground1;
    CCNode *_ground2;
    NSArray *_grounds;

    NSTimeInterval _sinceTouch;

    NSMutableArray *_obstacles;

    CCButton *_restartButton;

    BOOL _gameOver;
    CCLabelTTF *_scoreLabel;
    CCLabelTTF *_nameLabel;

    int points;



}

- (void)initialize
{
    // your code here

    character = (Character*)[CCBReader load:@"Character"];
    [physicisNode addChild:character];

    [self addObstacle];
    timeSinceObstacle = 0.0f;
}




-(void) didloadFromCCB {

        // set this class as delegate
    physicisNode.collisionDelegate = self;

    _obstacles = [NSMutableArray array];
    points = 0;
    _scoreLabel.visible = true;

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

    if (!_gameOver) {
        [character.physicsBody applyAngularImpulse:10000.f];
        _sinceTouch = 0.f;

        @try
        {
            [super touchBegan:touch withEvent:event];
        }
        @catch(NSException* ex)
        {

        }
    }


        //  [character flap];
}

-(void) addObstacle {

    Obstacle *obstacle = (Obstacle *)[CCBReader load:@"Obstacle"];
    CGPoint screenPosition = [self convertToWorldSpace:ccp(380, 0)];
        // CGPoint worldPosition = [CCPhysicsNode convertToNodeSpace:screenPosition];
    obstacle.position = worldPosition;
    [obstacle setupRandomPosition];
    obstacle.zOrder = DrawingOrderPipes;
        //  [CCPhysicsNode addChild:obstacle];
    [_obstacles addObject:obstacle];

}
-(void) showScore {
    
}

@end
