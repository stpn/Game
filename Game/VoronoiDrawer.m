//
//  VoronoiDrawer.m
//  G4me
//
//  Created by Zzbg on 7/23/11.
//  Copyright 2011 NYU. All rights reserved.
//

#import "VoronoiDrawer.h"
#import "DelaunayVoronoi.h"
#import "DelaunaySite.h"
#import "DelaunayPolygon.h"

@implementation VoronoiDrawer

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

- (void)drawVoronoi: (id) sender{
    
    CGSize winSize = [[CCDirector sharedDirector] winSize];
    points = [NSMutableArray arrayWithObjects: nil];
    float x;
    float y;
    for (float i=0; i<=winSize.width; i+=20+arc4random()%40){
        for (float j=0; j<=winSize.height; j+=20+arc4random()%40) {
            x = i;
            y = j;
            [points addObject:  [NSValue valueWithCGPoint: CGPointMake( x, y)]];
        }
        
        if([points count]>200){
            break;
        }
    }
    plotBounds = CGRectMake(0, 0, winSize.width, winSize.height);
    
    voronoi = [DelaunayVoronoi voronoiWithPoints: points plotBounds: plotBounds];
    [voronoi retain];
    [points retain];
    
    
    /*    To get the centers:
     
     for (DelaunaySite *site in voronoi.siteList.sites) {
     // do something with the site.coordinates here
     }
     */   
    //    To get the polygons:
    
    
    for (NSArray *region in [voronoi regions]) {
        int distance = 120;
        for (NSInteger k = 5; k<[region count]; k++){
            CGPoint p1 = [[region objectAtIndex:k] CGPointValue];
            CGPoint p2 = [[region objectAtIndex:k-1] CGPointValue];
            CGPoint p3 = [[region objectAtIndex:k-2] CGPointValue];
            CGPoint p4 = [[region objectAtIndex:k-3] CGPointValue];
            CGPoint p5 = [[region objectAtIndex:k-4] CGPointValue];
            CGPoint p6 = [[region objectAtIndex:k-5] CGPointValue];
            glColor4ub(255, 255, 255, 255);                                                                                                                                              

            ccDrawLine(p1, p2);
            CGPoint vertices[] = {p6,p5,p4,p3,p2,p1};
            
            glColor4ub(arc4random()%255, arc4random()%255, arc4random()%255, arc4random()%255);                                                                                                                                              
            
            if(ccpDistance(p1, p2)<=distance){ 
                if(ccpDistance(p1, p3)<=distance){
                    if(ccpDistance(p1, p4)<=distance){
                        if(ccpDistance(p1, p5)<=distance){
                            if(ccpDistance(p1, p6)<=distance){
                                if(ccpDistance(p3, p2)<=distance){
                                    if(ccpDistance(p4, p2)<=distance){
                                        if(ccpDistance(p5, p2)<=distance){
                                            if(ccpDistance(p6, p2)<=distance){
                                                if(ccpDistance(p3, p4)<=distance){
                                                    if(ccpDistance(p3, p5)<=distance){
                                                        if(ccpDistance(p3, p6)<=distance){
                                                            if(ccpDistance(p4, p5)<=distance){
                                                                if(ccpDistance(p4, p6)<=distance){
                                                                    if(ccpDistance(p5, p6)<=distance){  
                                                                  
                                                                        ccFillPoly(vertices, 6,YES);
                                                                                            }}}}}}}}}}}}}}}
            else{
                continue;
            }
            
        }
    }
    
}





- (void)dealloc
{
    [voronoi release];
    [points release];
    

    [super dealloc];
}

@end
