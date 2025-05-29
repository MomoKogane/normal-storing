import Logger from './Logger';
import { appAccount } from '@kit.BasicServicesKit';

// 定义日志标签，用于标识AccountModel模块的日志信息
const TAG: string = '[AccountModel]';
// 创建AppAccountManager实例，用于管理账户
const app: appAccount.AppAccountManager = appAccount.createAppAccountManager();

/**
 * AccountModel类提供了账户管理的功能，包括账户的添加、删除、凭证设置和关联数据的管理
 */
export class AccountModel {
  /**
   * 添加新账户
   * @param username 新账户的用户名
   */
  async addAccount(username: string) {
    await app.createAccount(username);
    Logger.info(TAG, `addAccount success`);
    return;
  }

  /**
   * 删除账户
   * @param username 要删除的账户的用户名
   */
  async deleteAccount(username: string) {
    await app.removeAccount(username);
    Logger.info(TAG, `deleteAccount success`);
    return;
  }

  /**
   * 设置账户凭证
   * @param username 账户用户名
   * @param credentialType 凭证类型
   * @param credential 凭证内容
   */
  async setAccountCredential(username: string, credentialType: string, credential: string) {
    await app.setCredential(username, credentialType, credential);
    Logger.info(TAG, `setAccountCredential success`);
    return;
  }

  /**
   * 设置账户关联数据
   * @param name 账户用户名
   * @param key 关联数据的键
   * @param value 关联数据的值
   */
  async setAssociatedData(name: string, key: string, value: string) {
    await app.setCustomData(name, key, value);
    Logger.info(TAG, `setAssociatedData success`);
    return;
  }

  /**
   * 获取账户凭证
   * @param name 账户用户名
   * @param credentialType 凭证类型
   * @returns 返回账户凭证
   */
  async getAccountCredential(name: string, credentialType: string) {
    let result = await app.getCredential(name, credentialType);
    Logger.info(TAG, `getAccountCredential success`);
    return result;
  }

  /**
   * 获取账户关联数据
   * @param name 账户用户名
   * @param key 关联数据的键
   * @returns 返回关联数据的值
   */
  async getAssociatedData(name: string, key: string) {
    let result = await app.getCustomData(name, key);
    Logger.info(TAG, `getAssociatedData success`);
    return result;
  }
}
