//
//  Grid.m
//  Life
//
//  Created by Ian Terrell on 12/2/10.
//  Copyright 2010 Ian Terrell. All rights reserved.
//

#import "Grid.h"

@implementation Grid

@synthesize rowCount, columnCount, cells;

#pragma mark -
#pragma mark Initializing

+(NSArray*)arrayOfCellsWithRows:(NSInteger)rowCount andColumns:(NSInteger)columnCount {
  NSMutableArray *grid = [[NSMutableArray alloc] initWithCapacity:rowCount];
  for (NSInteger i = 0; i < rowCount; i++) {
    NSMutableArray *row = [[NSMutableArray alloc] initWithCapacity:columnCount];
    for (NSInteger j = 0; j < columnCount; j++)
      [row addObject:[[Cell alloc] init]];
    [grid addObject:row];
  }
  return grid;
}

-(id)initWithSize:(NSInteger)size {
  return [self initWithRows:size andColumns:size];
}

- (id)initWithRows:(NSInteger)_rowCount andColumns:(NSInteger)_columnCount {
  self.rowCount = _rowCount;
  self.columnCount = _columnCount;
  self.cells = [[self class] arrayOfCellsWithRows:rowCount andColumns:columnCount];
  return self;
}

#pragma mark -
#pragma mark Querying

-(Cell*)cellAtRow:(NSInteger)rowIndex andColumn:(NSInteger)columnIndex {
  return (Cell*)[[cells objectAtIndex:rowIndex] objectAtIndex:columnIndex];
}

-(BOOL)isAliveAtRow:(NSInteger)rowIndex andColumn:(NSInteger)columnIndex {
  if (rowIndex < 0 || rowIndex >= rowCount || columnIndex < 0 || columnIndex >= columnCount)
    return NO;
  else
    return [self cellAtRow:rowIndex andColumn:columnIndex].alive;
}

-(NSInteger)livingNeighborCountAtRow:(NSInteger)rowIndex andColumn:(NSInteger)columnIndex {
  // FIXME:  hardcoded algorithm for detecting neighbors
  NSInteger count = 0;
  for (NSInteger row = rowIndex - 1; row <= rowIndex + 1; row++)
    for (NSInteger column = columnIndex - 1; column <= columnIndex + 1; column++)
      if (!(row == rowIndex && column == columnIndex) && [self isAliveAtRow:row andColumn:column])
        count++;
  return count;
}

- (NSArray *)nextGeneration {
  // FIXME:  hardcoded algorithm for survival and reproduction
  Grid *newGrid = [[[Grid alloc] initWithRows:rowCount andColumns:columnCount] autorelease];
  
  for (NSInteger row = 0; row < rowCount; row++) {
    for (NSInteger column = 0; column < columnCount; column++) {
      NSInteger neighborsAlive = [self livingNeighborCountAtRow:row andColumn:column];
      if ([self isAliveAtRow:row andColumn:column]) {
        if (neighborsAlive > 1 && neighborsAlive < 4)
          [newGrid animateCellAtRow:row andColumn:column];
      } else {
        if (neighborsAlive == 3)
          [newGrid animateCellAtRow:row andColumn:column];
      }
    }
  }
  
  return newGrid.cells;
}

#pragma mark -
#pragma mark Transforming

-(void)animateCellAtRow:(NSInteger)rowIndex andColumn:(NSInteger)columnIndex {
  [self cellAtRow:rowIndex andColumn:columnIndex].alive = YES;
}

-(void)killCellAtRow:(NSInteger)rowIndex andColumn:(NSInteger)columnIndex {
  [self cellAtRow:rowIndex andColumn:columnIndex].alive = NO;
}

-(void)toggleCellAtRow:(NSInteger)rowIndex andColumn:(NSInteger)columnIndex {
  if ([self isAliveAtRow:rowIndex andColumn:columnIndex])
    [self killCellAtRow:rowIndex andColumn:columnIndex];
  else
    [self animateCellAtRow:rowIndex andColumn:columnIndex];
}

- (void)evolve {
  self.cells = [self nextGeneration];
}

#pragma mark -
#pragma mark Displaying

- (void)log {
  NSLog(@"Game grid:");
  
  NSArray *row;
  Cell* cell;
  
  NSEnumerator *rowEnumerator = [cells objectEnumerator];
  while (row = [rowEnumerator nextObject]) {
    NSMutableString *rowString = [NSMutableString stringWithCapacity:columnCount];
    NSEnumerator *cellEnumerator = [row objectEnumerator];
    while (cell = [cellEnumerator nextObject])
      [rowString appendString:(cell.alive ? @"x" : @"o")];
    NSLog(@"%@", rowString);
  }
}

#pragma mark -
#pragma mark Maintenance

- (void)dealloc {
  // TODO:  anything about the individual columns and cells? autorelease on allocation?
  [cells release];
  [super dealloc];
}

@end
