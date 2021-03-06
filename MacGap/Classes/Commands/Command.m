//
//  Command.m
//  MG
//
//  Created by Tim Debo on 5/23/14.
//
//

#import "Command.h"
#import "WindowController.h"
#import <WebKit/WebKit.h>

@implementation Command
@synthesize webView, windowController;
+ (JSValue *)makeConstructor:(id)block inContext:(JSContext *)context {
    JSValue *fun = [context evaluateScript:@"(function () { return this.__construct.apply(this, arguments); });"];
    fun[@"prototype"][@"__construct"] = block;
    return fun;
}

+ (JSValue *)constructor {
    return [self makeConstructor:^{ return [self new]; } inContext:JSContext.currentContext];
}

- (NSString*) exportName {
    return NSStringFromClass([self class]);
}

- (id) initWithWindowController:(WindowController *)aWindowController
{
    self = [super init];
    if(self) {
        self.windowController = aWindowController;
        self.webView = aWindowController.webView;
    }
    
    return self;

}

- (void) initializePlugin {}

@end
