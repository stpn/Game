//
//  HelloWorldLayer.m
//  Game
//
//  Created by Zzbg on 7/23/11.
//  Copyright NYU 2011. All rights reserved.
//


// Import the interfaces
#import "HelloWorldLayer.h"

// HelloWorldLayer implementation
@implementation HelloWorldLayer

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	HelloWorldLayer *layer = [HelloWorldLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

// on "init" you need to initialize your instance
-(id) init
{
	
	if( (self=[super init])) {
        CGSize winSize = [[CCDirector sharedDirector] winSize];

        voronoiDrawer  = [[VoronoiDrawer alloc] init];

        
        
        target = [[CCRenderTexture renderTextureWithWidth:winSize.width height:winSize.height] retain];
        [target setPosition:ccp(winSize.width/2, winSize.height/2)];
        [self addChild:target z:-1];
        
		
        [CCMenuItemFont setFontSize:20];
		CCMenuItem *item1 = [CCMenuItemFont itemFromString:@"Voronoi!" target:self selector:@selector(drawTexture:)];
		CCMenuItem *item2 = [CCMenuItemFont itemFromString:@"No More Voronoi!" target:self selector:@selector(clearImage:)];
		CCMenu *menu = [CCMenu menuWithItems:item1, item2, nil];
		[self addChild:menu];
		[menu alignItemsVertically];
		[menu setPosition:ccp(winSize.width-80, winSize.height-30)];
        
				
	    self.isTouchEnabled = YES;

    }
	return self;

}


-(void) clearImage:(id)sender
{
    [target clear:0 g:0 b:0 a:255];
}



-(void) drawTexture: (id)sender{
    [target clear:0 g:0 b:0 a:255];

    [target begin];
    [voronoiDrawer drawVoronoi:nil];
    [target end];

}

// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
	// in case you have something to dealloc, do it in this method
	// in this particular example nothing needs to be released.
	// cocos2d will automatically release all the children (Label)
        [voronoiDrawer release];
    [target release];
    [[CCTextureCache sharedTextureCache] removeUnusedTextures];
    
    



	// don't forget to call "super dealloc"
	[super dealloc];
}
@end
