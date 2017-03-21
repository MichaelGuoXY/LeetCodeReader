// Generated by Apple Swift version 3.0 (swiftlang-800.0.46.2 clang-800.0.38)
#pragma clang diagnostic push

#if defined(__has_include) && __has_include(<swift/objc-prologue.h>)
# include <swift/objc-prologue.h>
#endif

#pragma clang diagnostic ignored "-Wauto-import"
#include <objc/NSObject.h>
#include <stdint.h>
#include <stddef.h>
#include <stdbool.h>

#if !defined(SWIFT_TYPEDEFS)
# define SWIFT_TYPEDEFS 1
# if defined(__has_include) && __has_include(<uchar.h>)
#  include <uchar.h>
# elif !defined(__cplusplus) || __cplusplus < 201103L
typedef uint_least16_t char16_t;
typedef uint_least32_t char32_t;
# endif
typedef float swift_float2  __attribute__((__ext_vector_type__(2)));
typedef float swift_float3  __attribute__((__ext_vector_type__(3)));
typedef float swift_float4  __attribute__((__ext_vector_type__(4)));
typedef double swift_double2  __attribute__((__ext_vector_type__(2)));
typedef double swift_double3  __attribute__((__ext_vector_type__(3)));
typedef double swift_double4  __attribute__((__ext_vector_type__(4)));
typedef int swift_int2  __attribute__((__ext_vector_type__(2)));
typedef int swift_int3  __attribute__((__ext_vector_type__(3)));
typedef int swift_int4  __attribute__((__ext_vector_type__(4)));
typedef unsigned int swift_uint2  __attribute__((__ext_vector_type__(2)));
typedef unsigned int swift_uint3  __attribute__((__ext_vector_type__(3)));
typedef unsigned int swift_uint4  __attribute__((__ext_vector_type__(4)));
#endif

#if !defined(SWIFT_PASTE)
# define SWIFT_PASTE_HELPER(x, y) x##y
# define SWIFT_PASTE(x, y) SWIFT_PASTE_HELPER(x, y)
#endif
#if !defined(SWIFT_METATYPE)
# define SWIFT_METATYPE(X) Class
#endif
#if !defined(SWIFT_CLASS_PROPERTY)
# if __has_feature(objc_class_property)
#  define SWIFT_CLASS_PROPERTY(...) __VA_ARGS__
# else
#  define SWIFT_CLASS_PROPERTY(...)
# endif
#endif

#if defined(__has_attribute) && __has_attribute(objc_runtime_name)
# define SWIFT_RUNTIME_NAME(X) __attribute__((objc_runtime_name(X)))
#else
# define SWIFT_RUNTIME_NAME(X)
#endif
#if defined(__has_attribute) && __has_attribute(swift_name)
# define SWIFT_COMPILE_NAME(X) __attribute__((swift_name(X)))
#else
# define SWIFT_COMPILE_NAME(X)
#endif
#if defined(__has_attribute) && __has_attribute(objc_method_family)
# define SWIFT_METHOD_FAMILY(X) __attribute__((objc_method_family(X)))
#else
# define SWIFT_METHOD_FAMILY(X)
#endif
#if !defined(SWIFT_CLASS_EXTRA)
# define SWIFT_CLASS_EXTRA
#endif
#if !defined(SWIFT_PROTOCOL_EXTRA)
# define SWIFT_PROTOCOL_EXTRA
#endif
#if !defined(SWIFT_ENUM_EXTRA)
# define SWIFT_ENUM_EXTRA
#endif
#if !defined(SWIFT_CLASS)
# if defined(__has_attribute) && __has_attribute(objc_subclassing_restricted)
#  define SWIFT_CLASS(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) __attribute__((objc_subclassing_restricted)) SWIFT_CLASS_EXTRA
#  define SWIFT_CLASS_NAMED(SWIFT_NAME) __attribute__((objc_subclassing_restricted)) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
# else
#  define SWIFT_CLASS(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
#  define SWIFT_CLASS_NAMED(SWIFT_NAME) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
# endif
#endif

#if !defined(SWIFT_PROTOCOL)
# define SWIFT_PROTOCOL(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) SWIFT_PROTOCOL_EXTRA
# define SWIFT_PROTOCOL_NAMED(SWIFT_NAME) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_PROTOCOL_EXTRA
#endif

#if !defined(SWIFT_EXTENSION)
# define SWIFT_EXTENSION(M) SWIFT_PASTE(M##_Swift_, __LINE__)
#endif

#if !defined(OBJC_DESIGNATED_INITIALIZER)
# if defined(__has_attribute) && __has_attribute(objc_designated_initializer)
#  define OBJC_DESIGNATED_INITIALIZER __attribute__((objc_designated_initializer))
# else
#  define OBJC_DESIGNATED_INITIALIZER
# endif
#endif
#if !defined(SWIFT_ENUM)
# define SWIFT_ENUM(_type, _name) enum _name : _type _name; enum SWIFT_ENUM_EXTRA _name : _type
# if defined(__has_feature) && __has_feature(generalized_swift_name)
#  define SWIFT_ENUM_NAMED(_type, _name, SWIFT_NAME) enum _name : _type _name SWIFT_COMPILE_NAME(SWIFT_NAME); enum SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_ENUM_EXTRA _name : _type
# else
#  define SWIFT_ENUM_NAMED(_type, _name, SWIFT_NAME) SWIFT_ENUM(_type, _name)
# endif
#endif
#if !defined(SWIFT_UNAVAILABLE)
# define SWIFT_UNAVAILABLE __attribute__((unavailable))
#endif
#if defined(__has_feature) && __has_feature(modules)
@import UIKit;
@import CoreGraphics;
@import Foundation;
@import ObjectiveC;
@import RealmSwift;
@import MessageUI;
#endif

#pragma clang diagnostic ignored "-Wproperty-attribute-mismatch"
#pragma clang diagnostic ignored "-Wduplicate-method-arg"
@class UIWindow;
@class UIApplication;

SWIFT_CLASS("_TtC9LeetCodee11AppDelegate")
@interface AppDelegate : UIResponder <UIApplicationDelegate>
@property (nonatomic, strong) UIWindow * _Nullable window;
- (BOOL)application:(UIApplication * _Nonnull)application didFinishLaunchingWithOptions:(NSDictionary<UIApplicationLaunchOptionsKey, id> * _Nullable)launchOptions;
- (void)applicationWillResignActive:(UIApplication * _Nonnull)application;
- (void)applicationDidEnterBackground:(UIApplication * _Nonnull)application;
- (void)applicationWillEnterForeground:(UIApplication * _Nonnull)application;
- (void)applicationDidBecomeActive:(UIApplication * _Nonnull)application;
- (void)applicationWillTerminate:(UIApplication * _Nonnull)application;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end

@class UIFont;
@class UIColor;
@class NSCoder;

SWIFT_CLASS("_TtC9LeetCodee15CustomSearchBar")
@interface CustomSearchBar : UISearchBar
@property (nonatomic, strong) UIFont * _Null_unspecified preferredFont;
@property (nonatomic, strong) UIColor * _Null_unspecified preferredTextColor;
- (void)drawRect:(CGRect)rect;
- (nonnull instancetype)initWithFrame:(CGRect)frame font:(UIFont * _Nonnull)font textColor:(UIColor * _Nonnull)textColor OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
- (nonnull instancetype)initWithFrame:(CGRect)frame SWIFT_UNAVAILABLE;
@end

@class UIViewController;
@class NSBundle;

SWIFT_CLASS("_TtC9LeetCodee22CustomSearchController")
@interface CustomSearchController : UISearchController <UIBarPositioningDelegate, UISearchBarDelegate>
@property (nonatomic, strong) CustomSearchBar * _Null_unspecified customSearchBar;
- (void)viewDidLoad;
- (void)didReceiveMemoryWarning;
- (nonnull instancetype)initWithSearchResultsController:(UIViewController * _Null_unspecified)searchResultsController searchBarFrame:(CGRect)searchBarFrame searchBarFont:(UIFont * _Nonnull)searchBarFont searchBarTextColor:(UIColor * _Nonnull)searchBarTextColor searchBarTintColor:(UIColor * _Nonnull)searchBarTintColor OBJC_DESIGNATED_INITIALIZER;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
- (void)configureSearchBarWithFrame:(CGRect)frame font:(UIFont * _Nonnull)font textColor:(UIColor * _Nonnull)textColor bgColor:(UIColor * _Nonnull)bgColor;
- (void)searchBarTextDidBeginEditing:(UISearchBar * _Nonnull)searchBar;
- (void)searchBarSearchButtonClicked:(UISearchBar * _Nonnull)searchBar;
- (void)searchBarCancelButtonClicked:(UISearchBar * _Nonnull)searchBar;
- (void)searchBar:(UISearchBar * _Nonnull)searchBar textDidChange:(NSString * _Nonnull)searchText;
- (nonnull instancetype)initWithSearchResultsController:(UIViewController * _Nullable)searchResultsController SWIFT_UNAVAILABLE;
@end

@class UIWebView;

SWIFT_CLASS("_TtC9LeetCodee17DescriptionTVCell")
@interface DescriptionTVCell : UITableViewCell
@property (nonatomic, weak) IBOutlet UIWebView * _Null_unspecified descriptionWebView;
@property (nonatomic, copy) NSString * _Null_unspecified descriptionOfProblem;
- (void)awakeFromNib;
- (void)loadDescriptionWebView;
- (void)updateUI;
- (void)setSelected:(BOOL)selected animated:(BOOL)animated;
- (nonnull instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString * _Nullable)reuseIdentifier OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end

@class Problem;
@class UITableView;
@class UITableViewRowAction;
@class UIStoryboardSegue;

SWIFT_CLASS("_TtC9LeetCodee18FavoriteProblemTVC")
@interface FavoriteProblemTVC : UITableViewController
@property (nonatomic, copy) NSArray<Problem *> * _Null_unspecified problems;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)animated;
- (void)didReceiveMemoryWarning;
- (NSInteger)numberOfSectionsInTableView:(UITableView * _Nonnull)tableView;
- (NSInteger)tableView:(UITableView * _Nonnull)tableView numberOfRowsInSection:(NSInteger)section;
- (UITableViewCell * _Nonnull)tableView:(UITableView * _Nonnull)tableView cellForRowAtIndexPath:(NSIndexPath * _Nonnull)indexPath;
- (NSArray<UITableViewRowAction *> * _Nullable)tableView:(UITableView * _Nonnull)tableView editActionsForRowAtIndexPath:(NSIndexPath * _Nonnull)editActionsForRowAt;
- (BOOL)tableView:(UITableView * _Nonnull)tableView canEditRowAtIndexPath:(NSIndexPath * _Nonnull)indexPath;
- (void)prepareForSegue:(UIStoryboardSegue * _Nonnull)segue sender:(id _Nullable)sender;
- (nonnull instancetype)initWithStyle:(UITableViewStyle)style OBJC_DESIGNATED_INITIALIZER;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end

@class FIRDatabaseReference;
@class NSUserDefaults;
@class GTProgressBar;
@class UILabel;

SWIFT_CLASS("_TtC9LeetCodee15FirebaseManager")
@interface FirebaseManager : NSObject
SWIFT_CLASS_PROPERTY(@property (nonatomic, class, strong) FIRDatabaseReference * _Nonnull ref;)
+ (FIRDatabaseReference * _Nonnull)ref;
+ (void)setRef:(FIRDatabaseReference * _Nonnull)value;
SWIFT_CLASS_PROPERTY(@property (nonatomic, class, readonly, strong) NSUserDefaults * _Nonnull userdefault;)
+ (NSUserDefaults * _Nonnull)userdefault;
+ (void)checkIfNeedsUpdate;
+ (void)fetchAllProblemsWithNavigate:(void (^ _Nonnull)(void))navigate progressBar:(GTProgressBar * _Nonnull)progressBar label:(UILabel * _Nonnull)label;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC9LeetCodee13GTProgressBar")
@interface GTProgressBar : UIView
@property (nonatomic, strong) UIFont * _Nonnull font;
@property (nonatomic) UIEdgeInsets progressLabelInsets;
@property (nonatomic, strong) UIColor * _Nonnull barBorderColor;
@property (nonatomic, strong) UIColor * _Nonnull barBackgroundColor;
@property (nonatomic, strong) UIColor * _Nonnull barFillColor;
@property (nonatomic) CGFloat barBorderWidth;
@property (nonatomic) CGFloat barFillInset;
@property (nonatomic) CGFloat progress;
@property (nonatomic, strong) UIColor * _Nonnull labelTextColor;
@property (nonatomic) BOOL displayLabel;
@property (nonatomic) CGFloat cornerRadius;
- (nonnull instancetype)initWithFrame:(CGRect)frame OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
- (void)layoutSubviews;
- (void)animateToProgress:(CGFloat)progress;
@end

@class UIBarButtonItem;
@protocol UIViewControllerTransitionCoordinator;
@class UIScrollView;

SWIFT_CLASS("_TtC9LeetCodee23HomeTableViewController")
@interface HomeTableViewController : UITableViewController
@property (nonatomic, weak) IBOutlet UIBarButtonItem * _Null_unspecified leftMenuButton;
@property (nonatomic, weak) IBOutlet UIBarButtonItem * _Null_unspecified rightMenuButton;
@property (nonatomic, copy) NSArray<Problem *> * _Nonnull problems;
@property (nonatomic, copy) NSArray<Problem *> * _Nonnull filteredProblems;
@property (nonatomic) BOOL shouldShowSearchResults;
@property (nonatomic, strong) CustomSearchController * _Null_unspecified searchController;
- (IBAction)leftMenuBtnClicked:(UIBarButtonItem * _Nonnull)sender;
- (IBAction)rightMenuBtnClicked:(UIBarButtonItem * _Nonnull)sender;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)animated;
- (void)reloadTableView;
- (void)didReceiveMemoryWarning;
- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id <UIViewControllerTransitionCoordinator> _Nonnull)coordinator;
- (void)configureSearchControllerWithWidth:(CGFloat)width;
- (void)didStartSearching;
- (void)didTapOnCancelButton;
- (void)didTapOnSearchButton;
- (void)didChangeSearchTextWithSearchText:(NSString * _Nonnull)searchText;
- (NSInteger)numberOfSectionsInTableView:(UITableView * _Nonnull)tableView;
- (NSInteger)tableView:(UITableView * _Nonnull)tableView numberOfRowsInSection:(NSInteger)section;
- (UITableViewCell * _Nonnull)tableView:(UITableView * _Nonnull)tableView cellForRowAtIndexPath:(NSIndexPath * _Nonnull)indexPath;
- (void)tableView:(UITableView * _Nonnull)tableView didSelectRowAtIndexPath:(NSIndexPath * _Nonnull)indexPath;
- (NSArray<UITableViewRowAction *> * _Nullable)tableView:(UITableView * _Nonnull)tableView editActionsForRowAtIndexPath:(NSIndexPath * _Nonnull)editActionsForRowAt;
- (void)prepareForSegue:(UIStoryboardSegue * _Nonnull)segue sender:(id _Nullable)sender;
- (void)sortByIdWithAscending:(BOOL)ascending;
- (void)sortByTitleWithAscending:(BOOL)ascending;
- (void)sortByAccepDiffWithAscending:(BOOL)ascending;
- (void)scrollViewWillEndDragging:(UIScrollView * _Nonnull)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(CGPoint * _Nonnull)targetContentOffset;
- (void)reloadHomeViewController;
- (nonnull instancetype)initWithStyle:(UITableViewStyle)style OBJC_DESIGNATED_INITIALIZER;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC9LeetCodee22LeftMenuViewController")
@interface LeftMenuViewController : UIViewController <UIScrollViewDelegate, UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, weak) IBOutlet UITableView * _Null_unspecified tableView;
@property (nonatomic) BOOL isOneToTwo;
@property (nonatomic) BOOL isEToH;
@property (nonatomic) BOOL isAToZ;
- (void)viewDidLoad;
- (void)didReceiveMemoryWarning;
- (NSInteger)tableView:(UITableView * _Nonnull)tableView numberOfRowsInSection:(NSInteger)section;
- (NSInteger)numberOfSectionsInTableView:(UITableView * _Nonnull)tableView;
- (UITableViewCell * _Nonnull)tableView:(UITableView * _Nonnull)tableView cellForRowAtIndexPath:(NSIndexPath * _Nonnull)indexPath;
- (CGFloat)tableView:(UITableView * _Nonnull)tableView heightForRowAtIndexPath:(NSIndexPath * _Nonnull)indexPath;
- (void)tableView:(UITableView * _Nonnull)tableView didSelectRowAtIndexPath:(NSIndexPath * _Nonnull)indexPath;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC9LeetCodee24MainTabBarViewController")
@interface MainTabBarViewController : UITabBarController
- (void)viewDidLoad;
- (void)didReceiveMemoryWarning;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end

@class UIImageView;

SWIFT_CLASS("_TtC9LeetCodee22OptionOneTableViewCell")
@interface OptionOneTableViewCell : UITableViewCell
@property (nonatomic, weak) IBOutlet UIImageView * _Null_unspecified imgView;
@property (nonatomic, weak) IBOutlet UILabel * _Null_unspecified titleLabel;
- (void)awakeFromNib;
- (void)setSelected:(BOOL)selected animated:(BOOL)animated;
- (nonnull instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString * _Nullable)reuseIdentifier OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end

@class NSArray;
@class RLMRealm;
@class RLMObjectSchema;
@class RLMSchema;

SWIFT_CLASS("_TtC9LeetCodee7Problem")
@interface Problem : RealmSwiftObject
@property (nonatomic) NSInteger id;
@property (nonatomic, copy) NSString * _Null_unspecified title;
@property (nonatomic) float acceptance;
@property (nonatomic, copy) NSString * _Null_unspecified descriptionn;
@property (nonatomic, copy) NSString * _Null_unspecified difficulty;
@property (nonatomic, copy) NSString * _Null_unspecified editorialLink;
@property (nonatomic, copy) NSString * _Null_unspecified problemLink;
@property (nonatomic) BOOL isFavorite;
@property (nonatomic, copy) NSString * _Null_unspecified tags;
@property (nonatomic) double timestamp;
- (void)initializeWithId:(NSInteger)id title:(NSString * _Nonnull)title acceptance:(float)acceptance description:(NSString * _Nonnull)description difficulty:(NSString * _Nonnull)difficulty editorialLink:(NSString * _Nonnull)editorialLink problemLink:(NSString * _Nonnull)problemLink solutions:(NSArray * _Nonnull)solutions tags:(NSString * _Nonnull)tags timestamp:(double)timestamp SWIFT_METHOD_FAMILY(none);
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
- (nonnull instancetype)initWithValue:(id _Nonnull)value OBJC_DESIGNATED_INITIALIZER;
- (nonnull instancetype)initWithRealm:(RLMRealm * _Nonnull)realm schema:(RLMObjectSchema * _Nonnull)schema OBJC_DESIGNATED_INITIALIZER;
- (nonnull instancetype)initWithValue:(id _Nonnull)value schema:(RLMSchema * _Nonnull)schema OBJC_DESIGNATED_INITIALIZER;
@end

@class UIButton;

SWIFT_CLASS("_TtC9LeetCodee27ProblemDetailViewController")
@interface ProblemDetailViewController : UIViewController <UIScrollViewDelegate, UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, weak) IBOutlet UITableView * _Null_unspecified tableView;
@property (nonatomic, weak) IBOutlet UIButton * _Null_unspecified backToTopBtn;
@property (nonatomic, strong) Problem * _Null_unspecified curProblem;
@property (nonatomic, copy) NSArray<NSString *> * _Null_unspecified solutions;
@property (nonatomic, copy) NSDictionary<NSNumber *, NSNumber *> * _Nonnull contentHeights;
@property (nonatomic, readonly, copy) NSArray<NSString *> * _Nonnull sectionTitleArr;
- (void)viewDidLoad;
- (void)backToTopBtnConfig;
- (IBAction)backToTopBtnClicked:(UIButton * _Nonnull)sender;
- (void)viewWillAppear:(BOOL)animated;
- (void)fetchSolutions;
- (void)didReceiveMemoryWarning;
- (NSInteger)numberOfSectionsInTableView:(UITableView * _Nonnull)tableView;
- (NSInteger)tableView:(UITableView * _Nonnull)tableView numberOfRowsInSection:(NSInteger)section;
- (UITableViewCell * _Nonnull)tableView:(UITableView * _Nonnull)tableView cellForRowAtIndexPath:(NSIndexPath * _Nonnull)indexPath;
- (NSString * _Nullable)tableView:(UITableView * _Nonnull)tableView titleForHeaderInSection:(NSInteger)section;
- (UIView * _Nullable)tableView:(UITableView * _Nonnull)tableView viewForHeaderInSection:(NSInteger)section;
- (void)tableView:(UITableView * _Nonnull)tableView didSelectRowAtIndexPath:(NSIndexPath * _Nonnull)indexPath;
- (void)reloadTableViewWithIndexPath:(NSIndexPath * _Nonnull)indexPath height:(CGFloat)height;
- (CGFloat)tableView:(UITableView * _Nonnull)tableView heightForRowAtIndexPath:(NSIndexPath * _Nonnull)indexPath;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC9LeetCodee13ProblemTVCell")
@interface ProblemTVCell : UITableViewCell
@property (nonatomic, weak) IBOutlet UILabel * _Null_unspecified id;
@property (nonatomic, weak) IBOutlet UILabel * _Null_unspecified title;
@property (nonatomic, weak) IBOutlet UILabel * _Null_unspecified acceptance;
@property (nonatomic, weak) IBOutlet UIImageView * _Null_unspecified firstNutImgView;
@property (nonatomic, weak) IBOutlet UIImageView * _Null_unspecified secondNutImgView;
@property (nonatomic, weak) IBOutlet UIImageView * _Null_unspecified thirdNutImgView;
@property (nonatomic, strong) Problem * _Null_unspecified problem;
- (void)awakeFromNib;
- (void)setSelected:(BOOL)selected animated:(BOOL)animated;
- (void)updateUI;
- (nonnull instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString * _Nullable)reuseIdentifier OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC9LeetCodee7RString")
@interface RString : RealmSwiftObject
@property (nonatomic, copy) NSString * _Nonnull stringValue;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
- (nonnull instancetype)initWithValue:(id _Nonnull)value OBJC_DESIGNATED_INITIALIZER;
- (nonnull instancetype)initWithRealm:(RLMRealm * _Nonnull)realm schema:(RLMObjectSchema * _Nonnull)schema OBJC_DESIGNATED_INITIALIZER;
- (nonnull instancetype)initWithValue:(id _Nonnull)value schema:(RLMSchema * _Nonnull)schema OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC9LeetCodee23RightMenuViewController")
@interface RightMenuViewController : UIViewController <UIScrollViewDelegate, UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, weak) IBOutlet UITableView * _Null_unspecified tableView;
- (void)viewDidLoad;
- (void)didReceiveMemoryWarning;
- (NSInteger)tableView:(UITableView * _Nonnull)tableView numberOfRowsInSection:(NSInteger)section;
- (NSInteger)numberOfSectionsInTableView:(UITableView * _Nonnull)tableView;
- (UITableViewCell * _Nonnull)tableView:(UITableView * _Nonnull)tableView cellForRowAtIndexPath:(NSIndexPath * _Nonnull)indexPath;
- (CGFloat)tableView:(UITableView * _Nonnull)tableView heightForRowAtIndexPath:(NSIndexPath * _Nonnull)indexPath;
- (void)tableView:(UITableView * _Nonnull)tableView didSelectRowAtIndexPath:(NSIndexPath * _Nonnull)indexPath;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC9LeetCodee18SendFeedbackTVCell")
@interface SendFeedbackTVCell : UITableViewCell
@property (nonatomic, weak) IBOutlet UILabel * _Null_unspecified label;
- (void)awakeFromNib;
- (void)setSelected:(BOOL)selected animated:(BOOL)animated;
- (nonnull instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString * _Nullable)reuseIdentifier OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end

@class MFMailComposeViewController;
@class UITouch;
@class UIEvent;
@class UITextField;
@class UITextView;

SWIFT_CLASS("_TtC9LeetCodee26SendFeedbackViewController")
@interface SendFeedbackViewController : UIViewController <MFMailComposeViewControllerDelegate>
@property (nonatomic, weak) IBOutlet UITextField * _Null_unspecified subject;
@property (nonatomic, weak) IBOutlet UITextView * _Null_unspecified content;
@property (nonatomic, weak) IBOutlet UIButton * _Null_unspecified sendBtn;
@property (nonatomic, weak) IBOutlet UIButton * _Null_unspecified cancelBtn;
- (void)viewDidLoad;
- (IBAction)sendBtnClicked:(UIButton * _Nonnull)sender;
- (IBAction)cancelBtnClicked:(UIButton * _Nonnull)sender;
- (void)sendEmail;
- (void)mailComposeController:(MFMailComposeViewController * _Nonnull)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError * _Nullable)error;
- (void)didReceiveMemoryWarning;
- (void)touchesBegan:(NSSet<UITouch *> * _Nonnull)touches withEvent:(UIEvent * _Nullable)event;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC9LeetCodee15SolutionsTVCell")
@interface SolutionsTVCell : UITableViewCell <UIWebViewDelegate>
@property (nonatomic, weak) IBOutlet UIWebView * _Null_unspecified solutionWebView;
@property (nonatomic, weak) IBOutlet UILabel * _Null_unspecified solutionTitleLabel;
@property (nonatomic, copy) NSString * _Null_unspecified solutionOfProblem;
@property (nonatomic, strong) ProblemDetailViewController * _Null_unspecified delegate;
@property (nonatomic, copy) NSIndexPath * _Null_unspecified indexPath;
@property (nonatomic) double contentHeight;
- (void)updateUI;
- (void)loadSolutionnWebViewWithHtml:(NSString * _Nonnull)html;
- (void)awakeFromNib;
- (void)setSelected:(BOOL)selected animated:(BOOL)animated;
- (nonnull instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString * _Nullable)reuseIdentifier OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end

@class GIFImageView;

SWIFT_CLASS("_TtC9LeetCodee19StartViewController")
@interface StartViewController : UIViewController
@property (nonatomic, readonly, strong) NSUserDefaults * _Nonnull userdefault;
@property (nonatomic, weak) IBOutlet UIView * _Null_unspecified blurView;
@property (nonatomic, weak) IBOutlet GIFImageView * _Null_unspecified gifImgView;
@property (nonatomic, weak) IBOutlet UILabel * _Null_unspecified label;
@property (nonatomic, weak) IBOutlet UIButton * _Null_unspecified updateBtn;
@property (nonatomic, weak) IBOutlet UIButton * _Null_unspecified useLocallyForeverBtn;
- (IBAction)useLocallyForeverBtnClicked:(UIButton * _Nonnull)sender;
- (IBAction)updateBtnClicked:(UIButton * _Nonnull)sender;
@property (nonatomic, weak) IBOutlet UIButton * _Null_unspecified useLocallyBtn;
- (IBAction)useLocallyBtnClicked:(UIButton * _Nonnull)sender;
@property (nonatomic, weak) IBOutlet GTProgressBar * _Null_unspecified progressBar;
- (void)viewDidLoad;
- (void)viewDidAppear:(BOOL)animated;
- (void)navigateToHomeView;
- (void)didReceiveMemoryWarning;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC9LeetCodee25TagSubTableViewController")
@interface TagSubTableViewController : UITableViewController
@property (nonatomic, copy) NSArray<Problem *> * _Nonnull problems;
@property (nonatomic, copy) NSArray<Problem *> * _Nonnull filteredProblems;
@property (nonatomic) BOOL shouldShowSearchResults;
@property (nonatomic, copy) NSString * _Null_unspecified tag;
@property (nonatomic, strong) CustomSearchController * _Null_unspecified searchController;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)animated;
- (void)reloadTableView;
- (void)didReceiveMemoryWarning;
- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id <UIViewControllerTransitionCoordinator> _Nonnull)coordinator;
- (void)configureSearchControllerWithWidth:(CGFloat)width;
- (void)didStartSearching;
- (void)didTapOnCancelButton;
- (void)didTapOnSearchButton;
- (void)didChangeSearchTextWithSearchText:(NSString * _Nonnull)searchText;
- (NSInteger)numberOfSectionsInTableView:(UITableView * _Nonnull)tableView;
- (NSInteger)tableView:(UITableView * _Nonnull)tableView numberOfRowsInSection:(NSInteger)section;
- (UITableViewCell * _Nonnull)tableView:(UITableView * _Nonnull)tableView cellForRowAtIndexPath:(NSIndexPath * _Nonnull)indexPath;
- (void)tableView:(UITableView * _Nonnull)tableView didSelectRowAtIndexPath:(NSIndexPath * _Nonnull)indexPath;
- (NSArray<UITableViewRowAction *> * _Nullable)tableView:(UITableView * _Nonnull)tableView editActionsForRowAtIndexPath:(NSIndexPath * _Nonnull)editActionsForRowAt;
- (void)prepareForSegue:(UIStoryboardSegue * _Nonnull)segue sender:(id _Nullable)sender;
- (void)scrollViewWillEndDragging:(UIScrollView * _Nonnull)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(CGPoint * _Nonnull)targetContentOffset;
- (nonnull instancetype)initWithStyle:(UITableViewStyle)style OBJC_DESIGNATED_INITIALIZER;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC9LeetCodee17TagViewController")
@interface TagViewController : UIViewController <UIScrollViewDelegate, UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, weak) IBOutlet UITableView * _Null_unspecified tableView;
@property (nonatomic, readonly, copy) NSArray<NSString *> * _Nonnull tags;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)animated;
- (void)didReceiveMemoryWarning;
- (NSInteger)numberOfSectionsInTableView:(UITableView * _Nonnull)tableView;
- (NSInteger)tableView:(UITableView * _Nonnull)tableView numberOfRowsInSection:(NSInteger)section;
- (UITableViewCell * _Nonnull)tableView:(UITableView * _Nonnull)tableView cellForRowAtIndexPath:(NSIndexPath * _Nonnull)indexPath;
- (NSInteger)countForTagWithTag:(NSString * _Nonnull)tag;
- (void)tableView:(UITableView * _Nonnull)tableView didSelectRowAtIndexPath:(NSIndexPath * _Nonnull)indexPath;
- (void)prepareForSegue:(UIStoryboardSegue * _Nonnull)segue sender:(id _Nullable)sender;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC9LeetCodee11TitleTVCell")
@interface TitleTVCell : UITableViewCell
@property (nonatomic, weak) IBOutlet UILabel * _Null_unspecified titleLabel;
@property (nonatomic, copy) NSString * _Null_unspecified titleOfProblem;
- (void)updateUI;
- (void)awakeFromNib;
- (void)setSelected:(BOOL)selected animated:(BOOL)animated;
- (nonnull instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString * _Nullable)reuseIdentifier OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC9LeetCodee24UpdateDataViewController")
@interface UpdateDataViewController : UIViewController
@property (nonatomic, readonly, strong) NSUserDefaults * _Nonnull userdefault;
@property (nonatomic, weak) IBOutlet GIFImageView * _Null_unspecified gifImgView;
@property (nonatomic, weak) IBOutlet UILabel * _Null_unspecified label;
@property (nonatomic, weak) IBOutlet GTProgressBar * _Null_unspecified progressBar;
- (void)viewDidLoad;
- (void)viewDidAppear:(BOOL)animated;
- (void)didReceiveMemoryWarning;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC9LeetCodee13WelcomeTVCell")
@interface WelcomeTVCell : UITableViewCell
@property (nonatomic, weak) IBOutlet UILabel * _Null_unspecified titleLabel;
- (void)awakeFromNib;
- (void)setSelected:(BOOL)selected animated:(BOOL)animated;
- (nonnull instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString * _Nullable)reuseIdentifier OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end

#pragma clang diagnostic pop
