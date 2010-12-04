//
//  LifeAppDelegate.h
//  Life
//
//  Created by Ian Terrell on 12/2/10.
//  Copyright 2010 Ian Terrell. All rights reserved.
//

#import <UIKit/UIKit.h>

@class OpenGLView;

@interface LifeAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    OpenGLView *glView;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet OpenGLView *glView;

@end

