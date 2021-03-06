//
//  AKCompatibility.h
//  AudioKit
//
//  Created by Stéphane Peter on 4/18/15.
//  Copyright (c) 2015 Aurelius Prochazka. All rights reserved.
//

#ifndef AudioKit_AKCompatibility_h
#define AudioKit_AKCompatibility_h

#import <TargetConditionals.h>

// Provide compatibility with Xcode < 6.3

#if !__has_feature(nullability)

# define NS_ASSUME_NONNULL_BEGIN
# define NS_ASSUME_NONNULL_END

# define nonnull
# define nullable
# define null_unspecified

# define __nonnull
# define __nullable
# define __null_unspecified

#endif


#endif
