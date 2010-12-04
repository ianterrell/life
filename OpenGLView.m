//
//  OpenGLView.m
//  Life
//
//  Created by Ian Terrell on 12/3/10.
//  Copyright 2010 Ian Terrell. All rights reserved.
//

#import "OpenGLView.h"


@implementation OpenGLView

//The EAGL view is stored in the nib file. When it's unarchived it's sent -initWithCoder:
- (id)initWithCoder:(NSCoder*)coder {
  NSLog(@"initialized here!");
  return self;
}

- (void)startAnimation {
}

- (void)stopAnimation {
}

- (void)dealloc {
  [super dealloc];
}

@end
