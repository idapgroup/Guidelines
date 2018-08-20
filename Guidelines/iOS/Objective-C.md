# Objective-C Guidelines

## Project Structure

- Project structure should be synchronized with file system;
- One `.h+.m` pair should contain only one entity (category, class, etc.);
- Expected structure

```
    Project folder
        xcode project
        xcode workspace
        Source          // shared between targets
        Vendor          // shared between targets
        Resources       // shared between targets
        Target folder
            main.m
            .plist
            Source      // target specific
            Resources   // target specific
            Lib         // target specific
```

**Source** - project sources;
**Vendor** - third-party libraries added without package manager usage;
**Resources** - resources, e.g. storyboards, images, etc..

```
Source folder:
    UI
        ViewController
            Private
                Subview.h/.m
                Subview.xib
                Cell.h/.m
                Cell.xib
            ViewController.h/.m
            View.h/.m
            ViewController.xib
    Models
    Lib
        Categories
        Classes
        Utilities
```

**UI** - folder containing **ViewControllers** in a separate folder each;
**ViewController** - folder containing one **ViewController** and its views;
**Private** - entities specific only for current view controller (mostly views);
**Models** - contains models, each in a separate subfolder;
**Lib** - additional shared entities in project.

- Further structuring depends on the task and should be decided by programmer;
- One folder shouldn't contain loads of source file, it should be split into subfolders in that case.

#### Entities file name

- Files should be named the same as the entities they contain.

#### Category file name

- Category file name naming convention is as follows: <ClassName>+<CategoryName>

E.g. `NSObject+IDPCategory`

## File Structure

#### h - file

**Order**:

0. copyrights;
1. imports;
2. forward declarations;
3. typedefs/constants/externs/macros/etc.;
4. protocols;
5. class interface;
6. class categories/extensions interfaces;

Each of the groups should be separated by an empty line.

```objective-c
//
// Created by Ivan Yolkin on 11/7/13
// Extended by Vasiliy Piterskiy, Evgeniy Pidrahujev
// Copyright (c) 2013 Company Name. All rights reserved.
//

#import <Foundation/Foundation.h>

@class UIControl;

@protocol SMPProtocol <NSObject>
...
@end

@interface SMPFoo : UIView <SMPProtocol>
...
@end

@interface SMPFoo (SMPExtensions)
...
@end
```

#### m - file

**Order**:

0. copyrights;
1. imports;
2. typedefs / constants / externs / macros / etc.;
3. protocols;
4. class extension;
5. private class category interface;
6. public class/category implementation;
7. private class category implementation.

Each of the groups should be separated by an empty line.

```objective-c
//
// Created by Ivan Yolkin on 11/7/13
// Extended by Vasiliy Piterskiy, Evgeniy Pidrahujev
// Copyright (c) 2013 Company Name. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "SMPFoo.h"

typedef CGRect IDPRect;

@interface IDPFoo ()
...
@end

@interface IDPFoo (IDPPrivateCategory)
...
@end

@implementation IDPFoo
...
@end

@interface IDPFoo (IDPPrivateCategory)
...
@end
```

#### imports

**Ordered based on header origin**:

1. standard library;
2. header of the current file (in case of `.m`-file);
3. third-party libraries;
4. shared project entites.

**Order inside each of the origins**:

1. classes, protocols, constants grouped logically;
2. categories;
3. macros.

There should be an empty line between each group and subgroup.

```objective-c
#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

#import "SMPFoo.h"

#import "IDPViewController.h"
#import "IDPView.h"
#import "IDPModel.h"

#import "NSObject+IDPExtensions.h"

#import "IDPBlockMacros"
```

#### Protocols, classes, categories, extensions interface method order

**Order**:

1. properties;
2. singleton methods;
3. factory class methods;
4. other class methods;
5. init instance methods;
6. other instance methods.

Each of the groups should be separated by an empty line.
There should be no empty lines between interface and property definitions.

```objective-c
@interface IDPFoo : UIView
@property (nonatomic, copy) NSString *string;

+ (id)sharedObject;

+ (id)fooWithString:(NSString *)string;

+ (Class)proxyClass;

- (id)initWithString:(NSString *)string;

- (void)execute;

@end
```

#### Classes, categories implementations method order

**Order:**

```
1. property synthesis:
    1. synthesize;
    2. dynamic;

2. class methods:
    1. singleton methods;
    2. factory class methods;
    3. other class methods;

3. init/dealloc:
    1. dealloc;
    2. init;
    3. NSCoder protocol;
    4. awakeFromNib;
    5. methods used for initializer decomposition, that are used in initializers only;

4. properties - for each individual ivar:
    1. getter;
    2. custom getter;
    3. setter;
    4. custom setter;

5. view lifecycle
6. IBActions
7. ungrouped public methods
8. grouped public and private methods
    1. public methods;
    2. private methods;

9. private methods

10. protocol related methods:
    1. methods of the protocol;
    2. methods used for protocol method decomposition, that are used in protocol methods only.
```

Each method should be delimited by an empty line.
Each group should be tagged with a separate `pragma mark` of the following format:

```objective-c
#pragma mark -
#pragma mark Pragma Name
```

Each pragma pair should be delimited by an empty line before and after pragma.

Standard pragma names:

* Class methods;
- Initializations and Deallocations;
- Accessors - проперти;
- View Lifecycle - only for entities related to view lifecycle (e.g. `- (void)viewDidLoad` for **UIViewController**);
- Interface Handling - all `IBAction`;
- Public methods;
- Private methods;
- Protocol Name.

Pragmas without methods should be omitted.

```objective-c
@implementation IDPViewController

@synthesize object  = _object;

@dynamic cached;

#pragma mark - Class Methods

+ (id)sharedObject {
    ...
}

+ (id)controllerWithModel:(id)model {
    ...
}

+ (void)setModelClass:(Class)class {
    ...
}

#pragma mark - Initializations and Deallocations

- (void)dealloc {
    ...
}

- (instancetype)init {
    self = [super init];
    [self prepareForNavigationController];

    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    [self prepareForNavigationController];

    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    ...
}

- (void)awakeFromNib {
    if (!self.object) {
        self.object = [self defaultObject];
    }

    ...
}

- (void)prepareForNavigationController {
    ...
}

- (id)defaultObject {
    ...
}

#pragma mark - Accessors

- (BOOL)isCached {
    ...
}

- (BOOL)isCachedInPath:(NSString *)path {
    ...
}

- (id)object {
    ...
}

- (void)setObject:(id)object {
    [self setObject:object animated:YES];
}

- (void)setObject:(id)object animated:(BOOL)animated {
    ...
}

#pragma mark - View Lifecycle

- (void)viewDidLoad {
    ...
}

#pragma mark - Interface Handling

- (IBAction)onButtonTap:(id)sender {
    ...
}

#pragma mark - Public

- (void)execute {
    ...
}

#pragma mark - View Update

// Public
- (void)updateView {
    [self reloadView];

    ...
}

// Private
- (void)reloadView {
    ...
}

#pragma mark - Private

- (void)updateModel {
    ...
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self updateCellAtIndexPath:indexPath];
    ...
}

// private method to improve protocol readability
- (void)updateCellAtIndexPath:(NSIndexPath *)indexPath {
    ...
}

@end
```

#### Property

* Properties should always have explicit atomicity and ownership;
* Properties should be grouped, each group should be delimited by an empty line;
* Each of the property groups should be aligned;
* In case of additional setters, they shouldn't be delimited by an empty line from respective properties, an empty line should be added after such setters;
* In case of shortcut setters, shortcut setters should be placed on top of full setters;
* In case of additional setters, there should be an empty line before `@property`.

```objective-c
@property (nonatomic, weak)     id object;
@property (nonatomic, strong)   id name;
@property (nonatomic, copy)     id fullName;

@property (nonatomic, assign)   NSUInteger    value;
@property (nonatomic, assign)   NSUInteger    age;

@property (nonatomic, assign)   NSUInteger    state;
- (void)setState:(NSUInteger)state animated:(BOOL)animated;
- (void)setState:(NSUInteger)state animated:(BOOL)animated completion:(id)completion;

@property (nonatomic, assign, readonly, getter=isCached)    BOOL   cached;
@property (nonatomic, assign, readonly, getter=isEnabled)   BOOL   enabled;
```

#### @synthesize/@dynamic

* There should be an empty line between `@implementation` and `@synthesize`/`@dynamic`;
* There should be an empty line between `@synthesize` and `@dynamic`;
* There should be no delimiters inside `@synthesize` and `@dynamic` groups.

```objective-c
@implementation IDPViewController

@synthesize object  = _object;
@synthesize string  = _string;

@dynamic cached;
@dynamic filePath;

@end
```

#### Shortcut methods

- Methods in `.h` and `.m` should be grouped in such a way, that shortcut methods would be located above full methods.

```objective-c
- (instancetype)init {
    return [self initWithModel:nil];
}

- (instancetype)initWithModel:(id)model {
    return [self initWithModel:model domain:[IDPDomain defaultDomain]];
}

- (instancetype)initWithModel:(id)model domain:(id)domain {
    ...
}
```

#### Empty line

- Each source file's last line should be empty;
- There should be just one empty line between logical blocks and groups;
- There should be no additional empty lines, if the method is a one-liner;

```objective-c
- (void)doSomething {
    NSLog(@"MAMA");
}
```

- Each `return` statement should be preceded by an empty line, except, when method is a one-liner;

```objective-c
- (id)value {
    return @"MAMA";
}

- (id)value {
    NSLog(@"PAPA");

    return @"MAMA";
}
```

- There should be an empty line before `@end`.

```objective-c
@interface IDPViewController : UIViewController
@property (readonly) id object;

@end
```

## Style

#### Property

- `@property` and specifiers should be separated by one space;
- There should be a tab after `@property` specifiers;
- Property groups should have common alignment for name and type.

```objective-c
@property (nonatomic, strong)   id         name;
@property (nonatomic, assign)   NSInteger  age;

@property (assign, readonly, getter=isCached)   BOOL   cached;
@property (assign, getter=isEnabled)            BOOL   enabled;
```

#### @synthesize/@dynamic

- `@synthesize`/`@dynamic` should define only one `property` per line;
- `@synthesize` groups should be aligned by =;
- There should be 1 space after =.

```objective-c
@synthesize userName  = _userName;
@synthesize string    = _string;

@dynamic cached;
@dynamic filePath;
```

#### Curly braces {}

- They should be open on the same line as the code;
- There should be 1 space before `{`, if there is a code on the same line, as opening brace;
- Closing brace should be on the line following the end of code;
- Next line after `}` should be empty, unless next line is `}` as well;
- Inner code in braces should be 1 tab farther, than outer;

```objective-c
if (statement) {
    NSLog(@"%@", var);
}

- (void)doSomething {
    if (statement) {
        NSLog(@"MAMA");
    }
}

- (void)doSomething {
    if (statement) {
        NSLog(@"MAMA");
    }

    {
        id object = nil;
        NSLog(@"%@", object);
    }
}
```

- There should be no alignment in inner code;

```objective-c
// wrong
if (statement) {
    NSUInteger count            = array.count;
    NSUInteger countToLoad      = array.countToLoad;

    NSUInteger loadedCount      = count - countToLoad;
}

// correct
if (statement) {
    NSUInteger count = array.count;
    NSUInteger countToLoad = array.countToLoad;

    NSUInteger loadedCount = count - countToLoad;
}
```

- Short blocks can be one-liners, if the readability is not affected;
- Code should be separated by spaces inside braces `{}`;

```objective-c
[array map:^(id object) { return [object description]; }];
```

- Curly braces should wrap all the code:

```objective-c
// wrong
- (void)doSomething {
    if (object.valid) return;
    ...
}

// correct
- (void)doSomething {
    if (object.valid) {
        return;
    }
    ...
}
```

- If the operation requiring opening the braces is multiline, `{` should be on the next line after the last line of operation:

```objective-c
if (object.valid
    && !receiver)
{
    ...
}

- (void)doSomethingWithObject:(id)object
                anotherObject:(id)anotherObject
{
    ...
}
```

#### Tabs

- Use spaces instead of tabs, tab length is 4 spaces.

#### * (pointer)

- There should be a space before the pointer;

```objective-c
NSObject *object = [NSObject new];
```

- There should be no spaces after the pointerПосле указателя пробела быть не должно;

```objective-c
static NSObject *object = nil;
static NSString *const string = @"MAMA";
```

#### Line symbol count

- Each line should consist of max 120 symbols;
- The only exception is a very long method, that can't be split into multiple lines based on standard splitting rules;

```objective-c
// should be split into multiple lines
[object doSomethingWithParameter1:parameter1 parameter2:parameter2 parameter3:parameter3 parameter4:parameter4 parameter5:parameter5];

 // shouldn't be split into multiple lines
[object doSomethingInAVeryLongAndVeryExcitingMethodWithSuperAwesomeDreamyYetMightyDevilishParameter:parameter];
```

#### Spaces

- There should be a space after `if`, `while`, `for`, etc;
- There should be a space between math operation and its operands;
- Code inside `()`, `<>` should be without enclosing spaces;
- Each case in enumeration should be delimited by a space after a comma;
- `()`, `<>` don't affect the spaces in outer code;
- There should be no spaces between type and protocol.

```objective-c
if (value == value)

for (int i = 0; i < x; i++) {
    ...
}

void CGRectMakeByZeroingOriginOfRect(CGRect rect);

int value = (a + b) / 2 + IDPWidth(view, formatter);

id<NSObject, NSCoding> object = (id)parameter;
```

#### Class definition

- `:` should be enclosed in spaces for defining parent class;
- There should be a space between parent class and adopted protocols;
- If `@interface` is longer, than 120 symbols, `{}` - formatting should be used, each protocol in that case should be on a separate line.

```objective-c
@interface IDPViewController : UIViewController <UITableViewDelegate>

@interface IDPViewController : UIViewController <
    UITableViewDelegate,
    UITableViewDataSource,
    NSCoding
>
```

#### Method definitions and calls

- There should be a space between `+/-` and return type;
- There should be no spaces after return type;

`- (void)doSomethingWithString:(NSString *)string flag:(BOOL)flag;`

- If the method is longer, than 120 symbols, each parameter should be placed on a new line with alignment on `:`;

```objective-c
- (void)doSomethingWithString:(NSString *)string
                         rect:(CGRect)rectangle
                       length:(NSUInteger)length;
```

- If the method is multiline and one of the lines goes left beyond the tab offsets of the current visibility , the whole message should be moved to the right.

```objective-c
- (void)        handleCustomValue:(id)value
    inMutableSetForAReallyLongKey:(NSString *)key
                  withSetMutation:(NSKeyValueSetMutationKind)mutation
                     withSelector:(SEL)selector

[self           handleCustomValue:value
    inMutableSetForAReallyLongKey:key
                  withSetMutation:mutation
                     withSelector:selector];
```

#### Definitions and calls of C - functions

- If `С` - function definition is longer, than 120 символов, each parameter should be placed on the new line;
- If the function call is longer, than 120 symbols, `()` in call should be formatted in the same way `{}` is formatted. In that case each parameter should be placed on the new line, there should be an empty line after the call, unless the next line is `}`;
- If the function definition in the implementation is longer, than 120 symbols, `()` in call should be formatted in the same way `{}` is formatted. In that case each parameter should be placed on the new line. `{` should be placed on the same line as `)` separated by one space;

```objective-c
void *IDPFunction(id object)

void *IDPFunction(
    id firstArgument,
    id secondArgument,
    id *outArgument,
    int other
) {
    int value = 1 + 3;

    return 5;
};

IDPFunction(
    firstArgument,
    secondArgument,
    outArgument,
    other
);
```

#### Protocol definition

- There should be an empty line before `@required` and `@optional` and none after them.

```objective-c
@protocol IDPProtocol <NSObject>

@optional
@property (assign)  BOOL married;

@required
- (void)load;

@optional
- (void)execute;
- (void)perform;

@end
```

#### Blocks

- There should be no whitespaces between `^` and block parameters:

`^(id response) {}`

- You must avoid specifying the return type;
- There should be no whitespaces between `^` and block name;
- Formatting is similar to C-functions.

```objective-c
// wrong
NSUInteger (^block)(id, id, id) = ^NSUInteger (
        id object,
        id anotherObject,
        id evenMoreObjects
) {
    ...

    return (NSUInteger)1;
};

// correct
NSUInteger (^block)(id, id, id) = ^(
    id object,
    id anotherObject,
    id evenMoreObjects
) {
    ...

    return (NSUInteger)1;
};

NSUInteger result = block(
    object,
    anotherObject,
    evenMoreObjects
);
```

#### extern, static, const, volatile specifiers

- Local and global constants/variables should have the specifiers on the same line, as entity definition;

```objective-c
static dispatch_once_t onceToken;
extern NSString *const IDPGlobalConst;

static void IDPFunction() {
    ...
}
```

#### Ternary operation

- `?` and `:` should be separated by whitespaces;

```objective-c
boolValue ? trueExpression : falseExpression;
```

#### Multiline ternary operation/maths

- Each line should start with the operation;
- In case of inner statements, they should be 1 tab to the right from outer statements;

```objective-c
NSUInteger result = boolValue
    ? value
    : object
        ? anotherObject
        : [anotherObject loaded];

CGFloat result = frame
    + (bounds * 3
       + value * 5)
    + 4;
```

## Naming

#### General

Following naming conventions should be used as a basis with exceptions outlined in this document [Apple Coding Guidelines for Cocoa](https://developer.apple.com/library/mac/documentation/Cocoa/Conceptual/CodingGuidelines/Articles/NamingBasics.html#//apple_ref/doc/uid/20001281-BBCHBFAH):

- Each entity (C - structs, functions, enums, types, etc., ObjC - classes, protocols, categories, etc.) name should contain a 2- or 3-letter prefix (3 letter prefix is a must in case the code would be reused in other projects);
- Naming should clearly outline, what the entity does, it's important that entities are designed using single responsibility principle.

**Following mistakes are not allowed:**

- abbreviations;

```objective-c
IDPUserVC *userCtl = ...; // wrong
IDPUserViewController *userController = ...; // correct
```

- senseless names;

```objective-c
id b = [NSArray new]; // wrong

id array = [NSArray new]; // correct
```

- exception - common iterator names `i,j`;

```objective-c
for (NSUInteger index = 0; index < array.count; index++) {
    NSLog(@"%@", array[index]);
}
```

- meaningless words in method names used to achieve the natural language:

```objective-c
// wrong
userViewControllerForPresentingFriends = [self.objectForRouting createViewControllerForPresentingFriendsOfUser:user];

// correct
userFriendsViewController = [self.router userFriendsViewControllerWithUser:user];
```

#### Parameter class в .h

As Objective-C++ `class` is a keyword, `class` named parameters should be avoided in Objective-C headers. Such parameters should be named `cls`.

```objective-c
@interface IDPProxy : NSProxy

+ (id)proxyMimickingClass:(Class)cls;

@end
```

#### Variable/property ID

In case `id` is used as a local variable or parameter, it should be called `ID`, same applies to `ID` derivatives, e.g. `userID`.

#### Property

- Specifier `getter=` should be used for `BOOL` property, property name should be prefixed with `is` in that case, if verbs, such as `will`, `did`, `should`, etc. are absent.

```objective-c
@property (assign, getter=isCached) BOOL   cached;
@property (assign)                  BOOL   shouldStop;
```

#### @synthesize

The synthesized `ivar` for a property should be have te same name as property prefixed by _.
**Property synthesis with `ivar` name differing the the property is not allowed**.

```objective-c
@synthesize object  = _object;
```

#### Category/Extension

- Category/extension name should be prefixed.

```objective-c
@interface IDPViewController (IDPCategory)
...
@end
```

#### Protocol

- Protocol name shouldn't contain a word `protocol`.

#### Observer/delegate protocols

Common cases of formatting:

**1. Method doesn't contain parameters and has a return type:**

* sender should be the first parameter;
* first phrase should describe, what the method returns;
* it should be clear, what is the relation between the returned value and the sender;
* formatting `- (id)object(With|For|Of|In|etc.)Sender:(id)sender; `

```objective-c
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView;
```

**2. Method doesn't contain parameters and doesn't have a return type:**

* sender should be the first parameter;
* `did`, `will` should be used to outline, what event would happen with a postfix describing, what exactly would happen;
* formatting `- (void)sender(Did|Will)DoSomething:(id)sender;`

```objective-c
- (void)activeRecordWillSave:(id)activeRecord;
- (void)requestDidFinishLoading:(id)request;
```

**3. Method has multiple parameters and doesn't have a return type:**

* sender should be the first parameter;
* `did`, `will` should be used to outline, what event would happen with a postfix describing, what exactly would happen;
* formatting `- (void)sender:(id)sender (did|will)DoSomethingWithObject:(id)object anotherObject:(id)anotherObject;`

```objective-c
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath;
- (void)tableView:(UITableView *)tableView didEndDisplayingCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath;
- (void)model:(id)model didFailLoadingWithError:(id)error state:(id)state;
```

**4. Method has one or more parameters and a return type:**

* sender should be the first parameter;
* first phrase should describe, what the method returns;
* formatting `- (id)sender:(id)sender objectWithParameter:(id)parameter anotherObject:(id)anotherObject;`

```objective-c
- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index
- (id)model:(id)model friendCountForUser:(id)user state:(id)state;
```

**5. General requirements for other method types:**

- Delegate/observer protocol methods should have sender as their first parameter;
- First phrase in a method should clearly outline, who sent the message (noun or adjective + noun);
- In methods with several parameters joining words (e.g. and) are optional and should be used only, if you can't put a comma between them in a natural language.

#### IBAction

`IBAction` should have formatting:

`- (IBAction)on(senderName)(senderType)(action):(id)sender;`

- it should always start with **`on`**;
- **senderName** - sender description - optional;
- **senderType** - sender type - required;
- **action** - event name, which led to `IBAction` call - optional, except for the case, when **senderName** generates several different event types;
- **sender** - sender parameter - required.

Event naming should be related to event or `gesture recognizer` `typedef`.

```objective-c
- (IBAction)onReloadButton:(id)sender {
    ...
}

- (IBAction)onSliderValueChanged:(id)sender {
    ...
}

- (IBAction)onSliderValueChanged:(id)sender {
    ...
}

- (IBAction)onSwitch:(id)sender {
    ...
}

- (IBAction)onUserImageLongTap:(id)sender {
    ...
}
```

#### Methods

**General method naming requirements:**

- parameter name should outline, which parameter type should be passed, additional clarification in of form of noun or adjective + noun is allowed before the parameter type;
- each parameter should be named;
- there should be a linker word (e.g. with) before the first parameter;
- in methods with several parameters joining words (e.g. and) are optional and should be used only, if you can't put a comma between them in a natural language;
- parameter names should be short enough and shouldn't yield senseless extra info;
- method name should be short with the goal of being close to the natural language;
- method names could be abstract only in case, when more detailed naming would yield creation of several methods.

**Method naming based on method kind:**

- Method without return type should start with a verb, that describes, what exactly would happen to the data;
- Method with a return type should start with an optional adjective and required noun(s) depicting, what would be returned from the method and its type..

```objective-c
- (void)load {
    ...
}

- (void)invalidateAndReloadDataWithID:(id)ID {
    ...
}

- (void)setupSubviewsWithHierarchy:(id)hierarchy specifiers:(id)specifiers {
    ...
}

- (id)viewWithID:(id)ID inSuperview:(id)superview {
    ...
}

- (id)userModel {
    ...
}

- (id)userModelWithID:(id)ID name:(id)name surname:(id)surname {
    ...
}
```

#### C

- C-function naming is similar to Objective-C, it should be prefixed;

```objective-c
void IDPPerformBlockWithLock(id<NSLocking> lock, IDPVoidBlock block) {
    IDPReturnIfNil(block);

    [lock lock];
    block();
    [lock unlock];
}
```

- Macros naming is similar to C-functions, formatting of macros immplementation should be similar to the code the macros is wrapping;

```objective-c
#define IDPSynthesizeLockingImplementation(class) \
    @implementation class (__IDPExtensions__##class) \
    \
    - (void)performBlock:(IDPVoidBlock)block { \
        IDPPerformBlockWithLock(self, block); \
    } \
    \
    @end
```

- `enum` name should be prefixed and typedefed, `enum` case should also be prefixed and should contain enum name;

```objective-c
typedef enum {
    IDPPModelReady,
    IDPModelFinished,
    IDPModelFailed,
} IDPModelState;
```

- `struct` name should be prefixed and typedefed, structure fields should be named with underscore for reference-type structures and without underscore for value-type structures;

```objective-c
struct IDPObject {
    int _intValue;
    BOOL _boolValue;
    CGRect _rect;
};
typedef struct IDPObject IDPObject;

struct CGRect {
    CGPoint origin;
    CGSize size;
};
typedef struct CGRect CGRect;
```

- Global variables/constants should be prefixed;

```objective-c
extern NSString *const IDPGlobalConst;
```

## Required best practices

#### Constants

- Magic numbers and strings should be avoided.
- `extern` should be used for constants with declaration in `.h` and value in `.m`:

```objective-c
// .h
extern NSString *const IDPGlobalConst;

// .m
NSString *const IDPGlobalConst  = @"IDPGlobalConst";
```

#### Literals

- Literals should always be used, unless literal is unsafe;
- A thorough consideration should be given to the fact, that literals don't really like nils;

#### Macros

- Macros should be used for code generation only. You should avoid using macros for constants or anything, that could be achieved without macro usage.

#### Super

- `super` should always be called, unless it's marked in the doc as such, which shouldn't be called.

#### Property dot syntax

- You should always use `property` dot syntax, if you are directly referencing a type;

```objective-c
NSArray *array = ...;
NSUInteger count = array.count;
```

- You should always use `property` method calls if the receiver is `id`.

```objective-c
id array = ...;
NSUInteger count = [array count];

NSSet *set = ...;
NSUInteger count = [[set allObjects] count];
```

#### @synthesize/@dynamic

Explicit synthesis should always be used when:

- `property` is atomic and `getter` or `setter` was overloaded;
- `property` is nonatomic and both `getter` and `setter` are overloaded;
- `property` - is a part of the protocol, that the class adopts.

Any dynamic property should always be marked as `@dynamic` to avoid ivar synthesis.

#### Enumerators vs loops

- Enumerators should be avoided
- Use `forin` wherever possible;
- In case `each/map/filter/take` are available, use them instead of loops.

#### Types Declaration / Usage

- `typedefs` should always be used for `block`, `enum`, `struct`, primitive types;
- Use foundation primitive types, rather than stdlib counterparts (`CGFloat`, `NSUInteger`, `BOOL` и т.п.)

#### Forward Declaration

- [forward declaration](http://railsware.com/blog/2013/08/09/using-forward-declaration-in-your-objective-c-projects/) should always be used;
- Only parent classes and protocols adopted by the entity should be imported into `.h`;
- Don't import the whole framework, only entities, that can't be wrapped into forward declarations.

#### Ivars/properties

- ivars should only be created using properties and synthesis;
- always prefer property to ivar;
- ivar should only be used inside their respective properties;
- ivars should only be used in `init/dealloc`, if property usage would yield an undefined behavior;
- User copy properties, if you expect immutable values, which have mutable counterparts (e.g, `NSString` and `NSMutableString`);
- Use `readonly` as much, as possible;
- Use `nonatomic` as much, as possible.
- Avoid using `setter=` specifier;
- `getter=` specifier should only be used for BOOL property readability improvements;
- If dynamic property creates an object or returns its copy, you should mark it with copy ownership.

#### Exceptions handling

Never use exceptions. Use ObjC `NSError **` pattern instead.

#### Protocols

- `@property`, variables, `ivar` should explicitly declare, that they adopt a protocol:

```objective-c
id<IDPProtocol> instance = ...;
@property (nonatomic, weak) id<IDPProtocol> delegate;
```

#### Boolean statements

- Never compare `BOOL` to `YES` or `NO`;
- Never compare to nil;
- Never use `if (statement)` or ternary operator, if your result is `BOOL`;

```objective-c
// wrong
- (BOOL)value {
    if (self.object) {
        return YES;
    }

    return NO;
}

// correct
- (BOOL)value {
    return self.object;
}
```

#### .pch

Avoid using `.pch`.
