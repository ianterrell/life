//
//  Shader.vsh
//  Life
//
//  Created by Ian Terrell on 12/2/10.
//  Copyright 2010 Ian Terrell. All rights reserved.
//

attribute vec4 position;
attribute vec4 color;

varying vec4 colorVarying;

uniform float translate;

void main()
{
    gl_Position = position;
    gl_Position.y += sin(translate) / 2.0;

    colorVarying = color;
}
