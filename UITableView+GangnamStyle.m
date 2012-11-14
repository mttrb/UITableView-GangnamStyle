//
//  UITableView+GangnamStyle.m
//  Gangnam Style
//
//  Created by Matthew Robinson on 20/10/12.
//  Copyright (c) 2012 Matthew Robinson. All rights reserved.
//

#import "UITableView+GangnamStyle.h"
#import <objc/runtime.h>


@interface PSYGangnam : NSObject <UITableViewDataSource>

+ (id)sharedGangnam;

@end


@implementation UITableView (GangnamStyle)

+ (void)load {    
    method_exchangeImplementations(
        class_getInstanceMethod(self, @selector(initWithFrame:style:)),
        class_getInstanceMethod(self, @selector(PSY_initWithFrame:style:))
    );
}

- (id)PSY_initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    // Call the original initWithFrame:style: which is now
    // called PSY_initWithFrame:style: This is NOT recursive!
    // If the style is Gangnam actually use plain
    
    self = [self PSY_initWithFrame:frame
                             style:style == UITableViewStyleGangnam ? UITableViewStylePlain : style];
    
    
    // Set the data source if Gangnam style
    if (self && style == UITableViewStyleGangnam) {
        [self setDataSource:[PSYGangnam sharedGangnam]];
    }
    
    return self;
}

@end



@interface PSYGangnam () {
    NSArray *_lyrics;
}

@end

@implementation PSYGangnam

+ (id)sharedGangnam {
    static PSYGangnam *sharedInstance = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        sharedInstance = [[PSYGangnam alloc] init];
    });
    
    return sharedInstance;
}


- (id)init {
    self = [super init];
    
    if (self) {
        _lyrics = [[NSArray alloc] initWithObjects:
                   @"Oppan Gangnam Style",
                   @"Gangnam Style",
                   @"",
                   @"Na je nun ta sa ro un in gan jo gin yo ja",
                   @"Ko pi han ja ne yo yu rul a neun pum gyo gi nun yo ja",
                   @"Ba mi o myon shim ja ngi tu go wo ji nun yo ja",
                   @"Gu ron ban jon i nun yo ja",
                   @"",
                   @"Na nun sa na ye",
                   @"Na je nun no man kum ta sa ro un gu ron sa na ye",
                   @"Ko pi shik gi do jo ne one shot te ri nun sa na ye",
                   @"Ba mi o myon shim ja ngi to jyo bo ri nun sa na ye",
                   @"Gu ron sa na ye",
                   @"",
                   @"A rum de wo sa rang su ro wo",
                   @"Gu re no hey gu re ba ro no hey",
                   @"A reum de wo sa rang su ro wo",
                   @"Gu re no hey gu re ba ro no hey",
                   @"Ji gum bu to gal de ka ji ga bol ka",
                   @"",
                   @"Oppan Gangnam Style",
                   @"Gangnam Style",
                   @"Op op op op oppan Gangnam Style",
                   @"Gangnam Style",
                   @"Op op op op oppan Gangnam Style",
                   @"",
                   @"Eh~ Sexy lady",
                   @"Op op op op oppan Gangnam Style",
                   @"Eh~ Sexy lady",
                   @"Op op op op",
                   @"Eh eh eh eh eh eh",
                   @"",
                   @"Jong su ke bo wi ji man nol ten no nun yo ja",
                   @"I te da shi pu myon mu ko ton mo ri pu nun yo ja",
                   @"Ga ryot ji man wen man han no chul boda ya han yo ja",
                   @"Gu ron gam gak jo gin yo ja",
                   @"",
                   @"Na nun sa na ye",
                   @"Jom ja na bo wi ji man nol ten no nun sa na ye",
                   @"Te ga dwe myon wan jon mi cho bo ri nun sa na ye",
                   @"Gun yuk bo da sa sa ngi ul tung bul tu ngan sa na ye",
                   @"Gu ron sa na ye",
                   @"",
                   @"A rum de wo sa rang su ro wo",
                   @"Gu re no hey gu re ba ro no hey",
                   @"A reum de wo sa rang su ro wo",
                   @"Gu re no hey gu re ba ro no hey",
                   @"Ji gum bu to gal de ka ji ga bol ka",
                   @"",
                   @"Oppan Gangnam Style",
                   @"Gangnam Style",
                   @"Op op op op oppan Gangnam Style",
                   @"Gangnam Style",
                   @"Op op op op oppan Gangnam Style",
                   @"",
                   @"Eh~ Sexy lady",
                   @"Op op op op oppan Gangnam Style",
                   @"Eh~ Sexy lady",
                   @"Op op op op",
                   @"Eh eh eh eh eh eh",
                   @"",
                   @"Twi nun nom gu wi ye na nun nom",
                   @"Baby baby na nun mol jom a nun nom",
                   @"Twi nun nom gu wi ye na nun nom",
                   @"Baby baby na nun mol jom a nun nom",
                   @"You know what I'm saying",
                   @"",
                   @"Oppan Gangnam Style",
                   @"Eh eh eh eh eh eh",
                   @"",
                   @"Eh~ Sexy lady",
                   @"Op op op op oppan Gangnam Style",
                   @"Eh~ Sexy lady",
                   @"Op op op op",
                   @"Eh eh eh eh eh eh",
                   @"",
                   @"Oppan Gangnam Style",
                   @"",
                   @"© Sony/ATV Music Publishing LLC",
                   nil
                   ];
    }
    
    return self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_lyrics count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *PSYGangnamCellIdentifier = @"PSYGangnamCellIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:PSYGangnamCellIdentifier];
    
    if (nil == cell) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                       reuseIdentifier:PSYGangnamCellIdentifier] autorelease];
                
        [[cell textLabel] setFont:[UIFont fontWithName:@"Helvetica-Bold" size:11.0]];
    }
    
    [[cell textLabel] setText:[_lyrics objectAtIndex:[indexPath row]]];
    
    return cell;
}

@end
