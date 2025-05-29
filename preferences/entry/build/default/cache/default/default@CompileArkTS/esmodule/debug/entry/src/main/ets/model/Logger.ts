import hilog from "@ohos:hilog";
const DOMAIN: number = 0xF811;
const PREFIX = 'Sample_Preferences';
const FORMAT = '%{public}s, %{public}s';
class Logger {
    debug(...args: any[]) {
        hilog.debug(DOMAIN, PREFIX, FORMAT, args);
    }
    info(...args: any[]) {
        hilog.info(DOMAIN, PREFIX, FORMAT, args);
    }
    warn(...args: any[]) {
        hilog.warn(DOMAIN, PREFIX, FORMAT, args);
    }
    error(...args: any[]) {
        hilog.error(DOMAIN, PREFIX, FORMAT, args);
    }
}
export default new Logger();
