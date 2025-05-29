import { hilog } from '@kit.PerformanceAnalysisKit';

/**
 * Logger类提供了日志记录的功能，封装了不同级别的日志方法
 * 它通过hilog模块记录带有特定域、前缀和格式的日志信息
 */
class Logger {
  private domain: number;
  private prefix: string;
  private format: string = '%{public}s, %{public}s';

  /**
   * 构造函数初始化Logger实例
   * @param prefix 日志前缀，用于标识日志来源
   */
  constructor(prefix: string) {
    this.prefix = prefix;
    // 0xFF00是日志域的示例值，用于过滤和区分不同类型的日志
    this.domain = 0xFF00;
  }

  /**
   * 记录调试级别日志
   * @param args 可变参数列表，包含日志消息的具体内容
   */
  debug(...args: string[]) {
    hilog.debug(this.domain, this.prefix, this.format, args);
  }

  /**
   * 记录信息级别日志
   * @param args 可变参数列表，包含日志消息的具体内容
   */
  info(...args: string[]) {
    hilog.info(this.domain, this.prefix, this.format, args);
  }

  /**
   * 记录警告级别日志
   * @param args 可变参数列表，包含日志消息的具体内容
   */
  warn(...args: string[]) {
    hilog.warn(this.domain, this.prefix, this.format, args);
  }

  /**
   * 记录错误级别日志
   * @param args 可变参数列表，包含日志消息的具体内容
   */
  error(...args: string[]) {
    hilog.error(this.domain, this.prefix, this.format, args);
  }
}

// 导出一个Logger实例，用于记录带有'[Sample_AppAccountManager]'前缀的日志
export default new Logger('[Sample_AppAccountManager]');
