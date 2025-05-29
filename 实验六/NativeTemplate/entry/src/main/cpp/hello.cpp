#include <hilog/log.h>
#include "napi/native_api.h"
#include<stdio.h>
#include<algorithm>
#include "./common/common.h"
/**
 * NAPI回调函数，接收三个整数参数，排序后返回逗号分隔的字符串结果。
 * 
 * @param env NAPI环境对象
 * @param info 回调信息对象
 * @return napi_value 返回包含排序后数字的字符串对象，失败时返回nullptr
 */
static napi_value mySort(napi_env env, napi_callback_info info){
    // 检查NAPI环境和回调信息是否为空，若为空则记录错误日志
    if ((nullptr == env) || (nullptr == info)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "MySortedNumbers", "env or info is null");
        return nullptr;
    }

    // 获取回调参数数量及参数数组，设置预期参数个数为3
    size_t argc = 3;
    napi_value args[3] = { nullptr };
    if (napi_ok != napi_get_cb_info(env, info, &argc, args, nullptr, nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "MySortedNumbers", "napi_get_cb_info failed");
        return nullptr;
    }

    // 将三个参数转换为int32类型，存储到values数组中
    int values[3] = {0};
    for (int i = 0; i < 3; ++i) {
        if (napi_ok != napi_get_value_int32(env, args[i], &values[i])) {
            OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "MySortedNumbers", "napi_get_value_double failed");
            return nullptr;
        }
    }

    // 使用标准库函数对数组进行升序排序
    std::sort(values, values + 3);

    // 生成格式化字符串结果，三个数字以逗号分隔
    char resultStr[128];
    snprintf(resultStr, sizeof(resultStr), "%d, %d, %d", values[0], values[1], values[2]);

    // 创建UTF-8编码的JavaScript字符串作为返回值
    napi_value napiResult;
    if (napi_ok != napi_create_string_utf8(env, resultStr, NAPI_AUTO_LENGTH, &napiResult)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "MySortedNumbers", "napi_create_string_utf8 failed");
        return nullptr;
    }

    return napiResult;
}

/**
 * NAPI模块初始化函数，注册mySort方法到JavaScript环境。
 * 
 * @param env NAPI环境对象
 * @param exports 导出对象
 * @return napi_value 返回导出对象，失败时返回nullptr
 */
EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports) {
    if ((nullptr == env) || (nullptr == exports)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Init", "env or exports is null");
        return exports;
    }

    // 定义模块导出属性，注册mySort函数
    napi_property_descriptor desc[] = {
        {"mySort", nullptr, mySort, nullptr, nullptr, nullptr, napi_default, nullptr}};
    if (napi_ok != napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Init", "napi_define_properties failed");
        return nullptr;
    }
    return exports;
}
EXTERN_C_END

static napi_module demoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "hello",
    .nm_priv = ((void *)0),
    .reserved = { 0 }
};

extern "C" __attribute__((constructor)) void RegisterModule(void)
{
    napi_module_register(&demoModule);
}
