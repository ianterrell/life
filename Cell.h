//
//  Cell.h
//  Life
//
//  Created by Ian Terrell on 12/2/10.
//  Copyright 2010 Ian Terrell. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Cell : NSObject {
  BOOL alive;
}

@property(nonatomic) BOOL alive;

-(id)init;

@end
