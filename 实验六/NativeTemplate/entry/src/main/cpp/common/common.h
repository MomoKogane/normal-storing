
#ifndef NativeTemplateDemo_common_H
#define NativeTemplateDemo_common_H

// Node APIs are not fully supported. To solve the compilation error of the interface cannot be found,
// please include "napi/native_api.h".
#include <napi/native_api.h>

/**
 * Parameter count.
 */
const int PARAMETER_COUNT = 2;

/**
 * Log print domain.
 */
const unsigned int LOG_PRINT_DOMAIN = 0xFF00;


#endif // NativeTemplateDemo_common_H
