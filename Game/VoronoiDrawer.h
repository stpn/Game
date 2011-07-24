//
//  VoronoiDrawer.h
//  G4me
//
//  Created by Zzbg on 7/23/11.
//  Copyright 2011 NYU. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DelaunayVoronoi.h"
#import "cocos2d.h"


@interface VoronoiDrawer : NSObject {

    DelaunayVoronoi *voronoi;
    NSMutableArray *points;
    CGRect plotBounds;


        
    
@private
    
}

-(void) drawVoronoi: (id) sender;
@end
