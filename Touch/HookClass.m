//
//  HookClass.m
//  testHook1
//
//  Created by 紫贝壳 on 2019/6/4.
//

#import "HookClass.h"
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
//#include <substrate.h>
#include "fishhook/fishhook.h"

#include <stdio.h>
#include <sys/time.h>
#include <time.h>

#import <objc/runtime.h>

#import "ImgTool.h"

#define USec_Scale (1000000LL)
uint64_t lastOrigUSec = 0, lastModifierUsec = 0;

//float multiple = 0.3;

static int (*orig_gettimeofday)(struct timeval *restrict, void *restrict);


#define _DWORD unsigned int
#define HIDWORD(x) (*((_DWORD *)&(x) + 1))
#define LODWORD(x) (*((_DWORD *)&(x)))

static int new_gettimeofday(struct timeval *tv, struct timezone *tz)
{
    NSLog(@"2222222222222");
    uint64_t curUSec = 0;
    float newInvl = 0.0;
    
    int ret = orig_gettimeofday(tv, tz);
    
    if ( [ImgTool share].multiple != 1.0 ) {
        curUSec = tv->tv_sec * USec_Scale + tv->tv_usec; //当前USec
        
        if ( lastOrigUSec != 0 ) {
            
            newInvl = [ImgTool share].multiple * (float)(curUSec - lastOrigUSec); //加倍后时间间隔
            lastOrigUSec = curUSec;
            
            lastModifierUsec += (uint64_t)newInvl;
            
            tv->tv_sec  = lastModifierUsec / USec_Scale;
            tv->tv_usec = lastModifierUsec % USec_Scale;
        }
        else {
            lastModifierUsec = lastOrigUSec = curUSec; //微妙级别
        }
        
    }
    
    
    return ret;
}



@implementation HookClass

+(void)load {
    struct timeval tv;
    gettimeofday(&tv, NULL);
    
    rebind_symbols((struct rebinding[1]){{"gettimeofday", new_gettimeofday, (void*)&orig_gettimeofday}},1);
    
    Class u3d = objc_getClass("UnityAppController");
    
    if ( u3d ) {
        
    }
    else {
        
       
    }
}

@end
