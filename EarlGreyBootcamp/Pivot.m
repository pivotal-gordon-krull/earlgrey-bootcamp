#import "Pivot.h"

@interface Pivot ()

@property (nonatomic, strong) NSString *fullName;
@property (nonatomic, strong) NSNumber *projectsLeading;
@property (nonatomic, strong) NSString *jobTitle;

@end

@implementation Pivot

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"fullName" : @"fullname",
             @"projectsLeading" : @"numprojects",
             @"jobTitle" : @"jobtitle",
             };
}

@end
