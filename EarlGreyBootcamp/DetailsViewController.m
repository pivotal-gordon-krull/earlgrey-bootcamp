#import "DetailsViewController.h"
#import "Pivot.h"

@interface DetailsViewController ()
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *jobLabel;
@property (weak, nonatomic) IBOutlet UILabel *projectsLabel;
@property (weak, nonatomic) IBOutlet UITextField *commentField;
@property (weak, nonatomic) IBOutlet UIButton *submitButton;

@end

@implementation DetailsViewController

- (instancetype)init {
    self = [super init];
    if (self) {
        UINavigationItem *navItem = self.navigationItem;
        navItem.title = @"DETAILS";
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.nameLabel.text = self.pivot.fullName;
    self.jobLabel.text = self.pivot.jobTitle;
    self.projectsLabel.text = [NSString stringWithFormat:@"%@", self.pivot.projectsLeading];
    self.submitButton.layer.cornerRadius = 3;
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.commentField resignFirstResponder];
}

- (IBAction)submitClicked:(id)sender {
    if (self.commentField.text != nil) {
        UIAlertController *alertControl = [UIAlertController alertControllerWithTitle:@"Comment Added"
                                                                              message:@"Your comment has beed added. (But not really since this is a sample app)"
                                                                       preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *ok = [UIAlertAction
                             actionWithTitle:@"OK"
                             style:UIAlertActionStyleDefault
                             handler:^(UIAlertAction * action)
                             {
                                 [alertControl dismissViewControllerAnimated:YES completion:nil];
                                 
                             }];
        [alertControl addAction:ok];
        [self presentViewController:alertControl animated:YES completion:nil];
    }
}

@end
