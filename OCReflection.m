//
//  OCReflection.m
//
//  Created by yangyang on 14-9-5.
//  Copyright (c) 2014年 stevyang. All rights reserved.
//
#import <objc/runtime.h>
#import "OCReflection.h"

@implementation OCReflection


/* 获取对象的所有属性和属性内容 */
- (NSDictionary *)objPropertiesAndValues:(id)object
{
    unsigned int count;
    NSMutableDictionary *props  = [NSMutableDictionary dictionary];
    objc_property_t *properties = class_copyPropertyList([object class], &count);
    
    for (int i = 0; i < count; i++)
    {
        objc_property_t property = properties[i];
        NSString *propName = [NSString stringWithUTF8String:property_getName(property)];
        id value = [object valueForKey:propName];
        [props setObject:value forKey:propName];
    }
    free(properties);
    return props;
}

/* 获取对象的所有属性 */
- (NSArray *)classPropertiesArray:(Class )className
{
    u_int            count;
    objc_property_t *properties     = class_copyPropertyList(className, &count);
    NSMutableArray *propertiesArray = [NSMutableArray arrayWithCapacity:count];
    
    for (int i = 0; i < count; i++)
    {
        const char *propertyName = property_getName(properties[i]);
        [propertiesArray addObject: [NSString stringWithUTF8String: propertyName]];
    }
    
    free(properties);    
    return propertiesArray;
}

@end
