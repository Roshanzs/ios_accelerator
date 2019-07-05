//
//  main.m
//  archivesTools
//
//  Created by 紫贝壳 on 2019/2/27.
//  Copyright © 2019 紫贝壳. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZSAssistiveTouch.h"

__attribute__((constructor)) static void EntryPoint()
{
    [ZSAssistiveTouch performSelector:@selector(getInstance) withObject:nil afterDelay:5.0];
}
