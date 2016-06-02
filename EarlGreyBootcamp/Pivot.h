#import <Foundation/Foundation.h>
#import <Mantle/Mantle.h>

@interface Pivot : MTLModel<MTLJSONSerializing>

@property (nonatomic, strong, readonly) NSString *fullName;
@property (nonatomic, strong, readonly) NSNumber *projectsLeading;
@property (nonatomic, strong, readonly) NSString *jobTitle;

@end
