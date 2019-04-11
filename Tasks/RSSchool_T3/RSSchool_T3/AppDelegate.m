#import "AppDelegate.h"
#import "DateMachine.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
  [self.window setRootViewController:[DateMachine new]];
  self.window.backgroundColor = [UIColor whiteColor];
  [self.window makeKeyAndVisible];
    
    UIView* view = [[UIView alloc] init];//initWithFrame:[CGRectMake(<#CGFloat x#>, <#CGFloat y#>, <#CGFloat width#>, <#CGFloat height#>)]]
   
    UIButton *addButton = [UIButton buttonWithType:UIButtonTypeCustom];
    addButton.frame = CGRectMake(10, 500, 60, 20);
    [addButton setTitle:@"Add" forState:UIControlStateNormal];
    
    
    
    UIButton *subButton = [UIButton buttonWithType:UIButtonTypeCustom];
    subButton.frame = CGRectMake(140, 500, 60, 20);
    [addButton setTitle:@"Sub" forState:UIControlStateNormal];
    [view addSubview:addButton];
    [view addSubview:subButton];
    
  return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
}


- (void)applicationWillTerminate:(UIApplication *)application {
}


@end
