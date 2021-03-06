/***
 * Excerpted from "Build iOS Games with Sprite Kit",
 * published by The Pragmatic Bookshelf.
 * Copyrights apply to this code. It may not be used to create training material, 
 * courses, books, articles, and the like. Contact us if you are in doubt.
 * We make no guarantees that this code is fit for any purpose. 
 * Visit http://www.pragmaticprogrammer.com/titles/pssprite for more book information.
***/
#import "RCWGameOverNode.h"

@implementation RCWGameOverNode

- (instancetype)init
{
    if (self = [super init]) {
        SKLabelNode *label = [SKLabelNode
                              labelNodeWithFontNamed:@"AvenirNext-Heavy"];
        label.fontSize = 32;
        label.fontColor = [SKColor whiteColor];
        label.text = @"Game Over";
        [self addChild:label];

        label.alpha = 0;
        label.xScale = 0.2;
        label.yScale = 0.2;

        SKAction *fadeIn = [SKAction fadeAlphaTo:1 duration:2];
        SKAction *scaleIn = [SKAction scaleTo:1 duration:2];
        SKAction *fadeAndScale = [SKAction group:@[fadeIn, scaleIn]];
        [label runAction:fadeAndScale];

        SKLabelNode *instructions = [SKLabelNode
                                     labelNodeWithFontNamed:@"AvenirNext-Medium"];
        instructions.fontSize = 14;
        instructions.fontColor = [SKColor whiteColor];
        instructions.text = @"Tap to try again.";
        instructions.position = CGPointMake(0, -45);
        [self addChild:instructions];

        instructions.alpha = 0;
        SKAction *wait = [SKAction waitForDuration:4];
        SKAction *appear = [SKAction fadeAlphaTo:1 duration:0.2];
        SKAction *popUp = [SKAction scaleTo:1.1 duration:0.1];
        SKAction *dropDown = [SKAction scaleTo:1 duration:0.1];
        SKAction *pauseAndAppear = [SKAction sequence:@[wait, appear, popUp, dropDown]];
        [instructions runAction:pauseAndAppear];
    }
    return self;
}

@end
