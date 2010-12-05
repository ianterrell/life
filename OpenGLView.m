//
//  OpenGLView.m
//  Life
//
//  Created by Ian Terrell on 12/3/10.
//  Copyright 2010 Ian Terrell. All rights reserved.
//

#import "OpenGLView.h"
#import <OpenGLES/ES1/gl.h>
#import <OpenGLES/ES1/glext.h>

@implementation OpenGLView

+ (Class)layerClass {
  return [CAEAGLLayer class];
}

//The EAGL view is stored in the nib file. When it's unarchived it's sent -initWithCoder:
- (id)initWithCoder:(NSCoder*)coder {
  if (self = [super initWithCoder:coder]) {
  
    // Set the layer to opaque for performance benefits
    CAEAGLLayer* eaglLayer = (CAEAGLLayer*) super.layer;
    eaglLayer.opaque = YES;
    
    // Create our OpenGL context using OpenGL ES 1.1, and make it current
    context = [[EAGLContext alloc] initWithAPI:kEAGLRenderingAPIOpenGLES1];
    if (!context || ![EAGLContext setCurrentContext:context]) {
      [self release];
      return nil;
    }
    
    GLuint framebuffer, renderbuffer;
    glGenFramebuffersOES(1, &framebuffer);
    glGenRenderbuffersOES(1, &renderbuffer);
    
    glBindFramebufferOES(GL_FRAMEBUFFER_OES, framebuffer);
    glBindRenderbufferOES(GL_RENDERBUFFER_OES, renderbuffer);
    
    [context renderbufferStorage:GL_RENDERBUFFER_OES fromDrawable:eaglLayer];
    glFramebufferRenderbufferOES(GL_FRAMEBUFFER_OES, GL_COLOR_ATTACHMENT0_OES, GL_RENDERBUFFER_OES, renderbuffer);
    glViewport(0, 0, self.frame.size.width, self.frame.size.height);
    [self drawView];
  }
  return self;
}

- (void)drawView {
  glClearColor(0.5f, 0.5f, 0.5f, 1);
  glClear(GL_COLOR_BUFFER_BIT);
  
  [context presentRenderbuffer:GL_RENDERBUFFER_OES];
}

- (void)startAnimation {
}

- (void)stopAnimation {
}

- (void)dealloc {
  [super dealloc];
}

@end
