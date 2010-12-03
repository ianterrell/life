//
//  Grid.h
//  Life
//
//  Created by Ian Terrell on 12/2/10.
//  Copyright 2010 Ian Terrell. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

@interface Grid : NSObject {
  NSInteger rowCount;
  NSInteger columnCount;
  NSArray *cells;
}

@property(nonatomic) NSInteger rowCount;
@property(nonatomic) NSInteger columnCount;
@property(nonatomic,retain) NSArray *cells;

#pragma mark -
#pragma mark Initializing
+(NSArray*)arrayOfCellsWithRows:(NSInteger)rowCount andColumns:(NSInteger)columnCount;
-(id)initWithSize:(NSInteger)size;
-(id)initWithRows:(NSInteger)rowCount andColumns:(NSInteger)columnCount;

#pragma mark -
#pragma mark Querying
-(Cell*)cellAtRow:(NSInteger)rowIndex andColumn:(NSInteger)columnIndex;
-(BOOL)isAliveAtRow:(NSInteger)rowIndex andColumn:(NSInteger)columnIndex;
- (NSArray *)nextGeneration;

#pragma mark -
#pragma mark Transforming
-(void)animateCellAtRow:(NSInteger)rowIndex andColumn:(NSInteger)columnIndex;
-(void)killCellAtRow:(NSInteger)rowIndex andColumn:(NSInteger)columnIndex;
-(void)toggleCellAtRow:(NSInteger)rowIndex andColumn:(NSInteger)columnIndex;
-(void)evolve;

#pragma mark -
#pragma mark Displaying
-(void)log;

@end
