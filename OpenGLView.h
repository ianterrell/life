//
//  OpenGLView.h
//  Life
//
//  Created by Ian Terrell on 12/3/10.
//  Copyright 2010 Ian Terrell. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface OpenGLView : UIView {
  EAGLContext *context;
}

- (void)drawView;
- (void)startAnimation;
- (void)stopAnimation;

@end
