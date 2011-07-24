//
//  HelloWorldLayer.h
//  Game
//
//  Created by Zzbg on 7/23/11.
//  Copyright NYU 2011. All rights reserved.
//


// When you import this file, you import all the cocos2d classes
#import "cocos2d.h"
#import "VoronoiDrawer.h"
#import "DelaunayVoronoi.h"
#import "DelaunaySite.h"
#import "DelaunayPolygon.h"


// HelloWorldLayer
@interface HelloWorldLayer : CCLayer
{
    VoronoiDrawer* voronoiDrawer;
    
    CCRenderTexture* target;


}

// returns a CCScene that contains the HelloWorldLayer as the only child
+(CCScene *) scene;

@end
