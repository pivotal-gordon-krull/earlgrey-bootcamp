#import "BootcampTableViewController.h"
#import "Constants.h"
#import "Pivot.h"
#import "DetailsViewController.h"
#import <AFNetworking/AFNetworking.h>

@interface BootcampTableViewController ()

@property NSArray *pivots;
@property (nonatomic, strong) AFHTTPSessionManager *sessionManager;

@end

@implementation BootcampTableViewController

- (instancetype)init {
    self = [super initWithStyle:UITableViewStylePlain];
    if (self) {
        UINavigationItem *navItem = self.navigationItem;
        navItem.title = @"ETT Pivots";
    }
    return self;
}

- (instancetype)initWithStyle:(UITableViewStyle)style {
    return [self init];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.sessionManager = [AFHTTPSessionManager new];
    [self.tableView registerClass:[UITableViewCell class]  forCellReuseIdentifier:@"cellReuse"];
    [[self loadPivotsFromDatabase] then:^id _Nullable(NSArray *pivotsArray) {
        self.pivots = pivotsArray;
        [self.tableView reloadData];
        return pivotsArray;
    } error:^id _Nullable(NSError * _Nullable error) {
        return error;
    }];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.pivots.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    Pivot *pivot = self.pivots[indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellReuse" forIndexPath:indexPath];
    cell.textLabel.text = pivot.fullName;
    return cell;
}

- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.tableView reloadData];
}

#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here, for example:
    // Create the next view controller.
    DetailsViewController *detailViewController = [[DetailsViewController alloc] init];
    
    // Pass the selected object to the new view controller.
    detailViewController.pivot = self.pivots[indexPath.row];
    
    // Push the view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
}

#pragma mark - Private

- (KSPromise *)loadPivotsFromDatabase {
    KSDeferred *pivotsDeferred = [KSDeferred defer];
    
    [self.sessionManager GET:@"http://bootcamp-db-cellulolytic-predikant.cfapps.io/api/v1/bootcamp"
                  parameters:nil
                    progress:nil
                     success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                         NSMutableArray *pivotsArray = [NSMutableArray array];
                         [responseObject enumerateObjectsUsingBlock:^(NSDictionary *obj, NSUInteger idx, BOOL * _Nonnull stop) {
                             NSError *mtlError = nil;
                             Pivot *pivotModel = [MTLJSONAdapter modelOfClass:[Pivot class]
                                                                fromJSONDictionary:obj
                                                                             error:&mtlError];
                             if (!mtlError && pivotModel) {
                                 [pivotsArray addObject:pivotModel];
                             }
                         }];
                         [pivotsDeferred resolveWithValue:pivotsArray];
                     } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                         [pivotsDeferred rejectWithError:error];
                     }];
    
    return pivotsDeferred.promise;
}


@end
