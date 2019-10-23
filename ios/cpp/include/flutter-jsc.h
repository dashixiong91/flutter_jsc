//
// Created by xinfeng on 2019-09-16.
//

#ifndef FLUTTER_JSC_H
#define FLUTTER_JSC_H

// JSC_EXTERN_C MACROS
#ifdef __cplusplus
#define JSC_EXTERN_C extern "C"
#else
#define JSC_EXTERN_C
#endif
// JSC_EXPORT MACROS
#if defined(__CYGWIN__)
#error Tool chain and platform not supported.
#elif defined(_WIN32)
#error Tool chain and platform not supported.
#elif  __GNUC__ >= 4
#define JSC_EXPORT JSC_EXTERN_C __attribute__((visibility("default"))) __attribute((used))
#else
#define JSC_EXPORT JSC_EXTERN_C
#endif

// include header files

// api start line

JSC_EXPORT int add(int,int);

// api end line

#endif // FLUTTER_JSC_H
