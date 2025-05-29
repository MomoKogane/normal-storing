import Logger from './Logger';
import { common } from '@kit.AbilityKit';
import { preferences } from '@kit.ArkData';

// 定义日志标签，用于在日志信息前添加标识
const TAG: string = '[AccountData]';
// 定义存储对象，用于持久化数据
let storage: preferences.Preferences;
// 定义临时存储对象，用于在不同存储操作中传递存储实例
let storageTemp: preferences.Preferences;

/**
 * 提供账户相关数据的存储操作功能
 */
export class AccountData {

  /*
  // 使用单例模式确保只有一个实例
  static instance: AccountData = null

  public static getInstance() {
    if (this.instance === null) {
      this.instance = new AccountData()
    }
    return this.instance
  }*/

  /**
   * 从存储中获取数据
   * @param context 上下文对象，用于获取存储实例
   * @param url 存储的名称，通常是一个URL
   */
  async getFromStorage(context: common.Context, url: string) {
    let name = url;
    Logger.info(TAG, `Name is ${name}`);
    try {
      storage = await preferences.getPreferences(context, `${name}`);
    } catch (err) {
      Logger.error(`getStorage failed, code is ${err?.code}, message is ${err?.message}`);
    }
    if (storage) {
      Logger.info(TAG, `Create stroage is fail.`);
    }
  }

  /**
   * 获取存储实例
   * @param context 上下文对象，用于获取存储实例
   * @param url 存储的名称，通常是一个URL
   * @returns 返回存储实例
   */
  async getStorage(context: common.Context, url: string) {
    storage = storageTemp;
    await this.getFromStorage(context, url);
    return storage;
  }

  /**
   * 向存储中写入数据
   * @param context 上下文对象，用于获取存储实例
   * @param key 要写入的数据的键
   * @param value 要写入的数据的值
   * @param url 存储的名称，通常是一个URL
   */
  async putStorageValue(context: common.Context, key: string, value: string, url: string) {
    storage = await this.getStorage(context, url);
    try {
      await storage.put(key, value);
      await storage.flush();
      Logger.info(TAG, `put key && value success`);
    } catch (err) {
      Logger.info(TAG, `aaaaaa put failed`);
    }
    return
  }

  /**
   * 检查存储中是否存在指定键的数据
   * @param context 上下文对象，用于获取存储实例
   * @param key 要检查的数据的键
   * @param url 存储的名称，通常是一个URL
   * @returns 返回一个布尔值，表示存储中是否存在指定键的数据
   */
  async hasStorageValue(context: common.Context, key: string, url: string) {
    storage = await this.getStorage(context, url);
    let result: boolean = false;
    try {
      result = await storage.has(key);
    } catch (err) {
      Logger.error(`hasStorageValue failed, code is ${err?.code}, message is ${err?.message}`);
    }
    Logger.info(TAG, `hasStorageValue success result is ${result}`);
    return result;
  }

  /**
   * 从存储中获取数据值
   * @param context 上下文对象，用于获取存储实例
   * @param key 要获取的数据的键
   * @param url 存储的名称，通常是一个URL
   * @returns 返回存储中的数据值，如果未找到则返回'null'
   */
  async getStorageValue(context: common.Context, key: string, url: string) {
    storage = await this.getStorage(context, url);
    let getValue: preferences.ValueType = 'null';
    try {
      getValue = await storage.get(key, 'null');
    } catch (err) {
      Logger.error(`getStorageValue failed, code is ${err?.code}, message is ${err?.message}`);
    }
    Logger.info(TAG, `getStorageValue success`);
    return getValue;
  }

  /**
   * 从存储中删除指定键的数据
   * @param context 上下文对象，用于获取存储实例
   * @param key 要删除的数据的键
   * @param url 存储的名称，通常是一个URL
   */
  async deleteStorageValue(context: common.Context, key: string, url: string) {
    storage = await this.getStorage(context, url);
    try {
      await storage.delete(key);
      await storage.flush();
    } catch (err) {
      Logger.error(`deleteStorageValue failed, code is ${err?.code}, message is ${err?.message}`);
    }
    Logger.info(TAG, `delete success`);
    return
  }
}
