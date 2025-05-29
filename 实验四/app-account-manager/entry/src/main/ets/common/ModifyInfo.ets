import { router } from '@kit.ArkUI';
import Logger from '../model/Logger';
import { AccountData } from '../model/AccountData';
import { AccountModel } from '../model/AccountModel';
import { preferences } from '@kit.ArkData';

// 定义日志标签，用于在日志输出时标识来源
const TAG: string = '[ModifyInfo]';

/**
 * BasicDataSource 类提供了数据管理的基础功能，包括数据的获取、添加、更新和删除等操作
 */
class BasicDataSource implements IDataSource {
  // 存储数据变更监听器的数组
  private listeners: DataChangeListener[] = [];

  /**
   * 返回数据的总数
   * @returns {number} 数据总数
   */
  public totalCount() {
    return 0;
  }

  /**
   * 根据索引获取数据项
   * @param {number} index 数据索引
   * @returns {DataArray} 数据项
   */
  public getData(index: number): DataArray {
    return new DataArray();
  }

  /**
   * 注册数据变更监听器
   * @param {DataChangeListener} listener 监听器实例
   */
  registerDataChangeListener(listener: DataChangeListener) {
    if (this.listeners.indexOf(listener) < 0) {
      this.listeners.push(listener);
    }
  }

  /**
   * 取消注册数据变更监听器
   * @param {DataChangeListener} listener 监听器实例
   */
  unregisterDataChangeListener(listener: DataChangeListener) {
    const pos = this.listeners.indexOf(listener);
    if (pos >= 0) {
      this.listeners.splice(pos, 1);
    }
  }

  /**
   * 通知所有监听器数据已重新加载
   */
  notifyDataReload() {
    this.listeners.forEach(listener => {
      listener.onDataReloaded();
    })
  }

  /**
   * 通知所有监听器数据已添加
   * @param {number} index 新数据的索引
   */
  notifyDataAdd(index: number) {
    this.listeners.forEach(listener => {
      listener.onDataAdd(index);
    })
  }

  /**
   * 通知所有监听器数据已变更
   * @param {number} index 变更数据的索引
   */
  notifyDataChange(index: number) {
    this.listeners.forEach(listener => {
      listener.onDataChange(index);
    })
  }

  /**
   * 通知所有监听器数据已删除
   * @param {number} index 被删除数据的索引
   */
  notifyDataDelete(index: number) {
    this.listeners.forEach(listener => {
      listener.onDataDelete(index);
    })
  }

  /**
   * 通知所有监听器数据已移动
   * @param {number} from 数据移动前的索引
   * @param {number} to 数据移动后的索引
   */
  notifyDataMove(from: number, to: number) {
    this.listeners.forEach(listener => {
      listener.onDataMove(from, to);
    })
  }
}

/**
 * DataArray 类定义了数据项的结构，包括文本、输入类型、长度等属性
 */
class DataArray {
  text: Resource = $r('app.string.empty');
  inputType: InputType = InputType.Normal;
  length: number = 0;
  event: number = 0;
  promptText: Resource = $r('app.string.empty');
}

/**
 * MyDataSource 类继承自 BasicDataSource，提供了具体的数据源管理功能
 */
class MyDataSource extends BasicDataSource {
  // 存储数据项的数组
  private dataArray: Array<DataArray> = [
    {
      text: $r('app.string.email'),
      inputType: InputType.Normal,
      length: 18,
      event: 0,
      promptText: $r('app.string.prompt_email')
    },
    {
      text: $r('app.string.signature'),
      inputType: InputType.Normal,
      length: 18,
      event: 1,
      promptText: $r('app.string.prompt_signature')
    },
    {
      text: $r('app.string.unpassword'),
      inputType: InputType.Password,
      length: 18,
      event: 2,
      promptText: $r('app.string.prompt_password')
    },
    {
      text: $r('app.string.unconfirm_password'),
      inputType: InputType.Password,
      length: 18,
      event: 3,
      promptText: $r('app.string.prompt_confirm_password')
    }
  ]

  /**
   * 重写父类方法，返回数据项总数
   * @returns {number} 数据项总数
   */
  public totalCount() {
    return this.dataArray.length;
  }

  /**
   * 重写父类方法，根据索引获取数据项
   * @param {number} index 数据索引
   * @returns {DataArray} 数据项
   */
  public getData(index: number) {
    return this.dataArray[index];
  }

  /**
   * 在指定索引位置添加数据项
   * @param {number} index 插入位置的索引
   */
  public addData(index: number) {
    this.dataArray.splice(index, 0);
    this.notifyDataAdd(index);
  }

  /**
   * 在数据项末尾添加数据
   * @param {number} index 插入位置的索引
   */
  public pushData(index: number) {
    this.dataArray.push();
    this.notifyDataAdd(this.dataArray.length - 1);
  }

  /**
   * 替换全部数据项
   * @param {Array<DataArray>} result 新的数据项数组
   */
  public replaceData(result: Array<DataArray>) {
    this.dataArray = result;
  }
}

/**
 * ModifyInfo 组件用于修改用户信息，包括用户名、邮箱、签名和密码等
 */
@Component
export struct ModifyInfo {
  @State passWord: string = '';
  @State emailInfo: string = '';
  @State signature: string = '';
  @State confirmPassword: string = '';
  @Prop username: string;
  @Prop bundleName: string;
  @State dataSet: MyDataSource = new MyDataSource();
  private storage: AccountData = new AccountData();
  private accountModel: AccountModel = new AccountModel();

  /**
   * 异步获取用户信息
   * @param {string} value 初始化值
   * @param {string} name 用户名
   * @param {string} credentialType 凭证类型
   * @returns {Promise<string>} 用户信息
   */
  async getInfo(value: string, name: string, credentialType: string) {
    try {
      value = await this.accountModel.getAccountCredential(name, credentialType);
      Logger.info(TAG, `getAccountCredential email is ${value}`);
    } catch (err) {
      Logger.info(TAG, `getAccountCredential failed err is ${JSON.stringify(err)}`);
    }
    return value
  }

  /**
   * 构建组件UI
   */
  build() {
    Column() {
      // 显示应用名称和包名
      Row() {
        Text($r('app.string.appname'))
          .margin(10)
          .fontSize(18)
          .width('25%')
          .textAlign(TextAlign.End)
        Text(this.bundleName)
          .margin(20)
          .width('55%')
          .fontSize(20)
          .textAlign(TextAlign.Start)
      }
      .margin(5)

      // 显示用户名
      Row() {
        Text($r('app.string.unusername'))
          .margin(10)
          .fontSize(18)
          .width('25%')
          .textAlign(TextAlign.End)
        Text(this.username)
          .margin(10)
          .width('55%')
          .fontSize(20)
          .textAlign(TextAlign.Start)
      }
      .margin(5)

      // 遍历数据项，显示输入框
      LazyForEach(this.dataSet, (item: DataArray, index: number) => {
        Row() {
          Text(item.text)
            .margin(10)
            .fontSize(18)
            .width('25%')
            .textAlign(TextAlign.End)
            .backgroundColor('#ffffff')
          Column() {
            Text(item.promptText)
              .fontSize(14)
              .width('80%')
              .fontColor('#ffb0b0b0')
              .textAlign(TextAlign.Center)

            TextInput({ placeholder: 'xxxxx' })
              .id('Modify' + (index + 1))
              .margin(10)
              .width('55%')
              .fontSize(20)
              .maxLength(20)
              .type(item.inputType)
              .maxLength(item.length)
              .fontWeight(FontWeight.Bold)
              .placeholderFont({ size: 16, weight: FontWeight.Normal })
              .onChange(async (value: string) => {
                switch (item.event) {
                  case 0:
                    this.emailInfo = value
                    break
                  case 1:
                    this.signature = value
                    break
                  case 2:
                    this.passWord = value
                    break
                  case 3:
                    this.confirmPassword = value
                    break
                  default:
                    break
                }
              })
          }
        }
        .margin(5)
      }, (item: DataArray) => JSON.stringify(item))

      // 保存按钮
      Button($r('app.string.setting'))
        .id('modComplete')
        .margin(10)
        .width('60%')
        .fontSize(20)
        .fontColor(Color.White)
        .type(ButtonType.Capsule)
        .onClick(async () => {
          // 更新用户信息
          if (this.emailInfo !== '') {
            await this.accountModel.setAccountCredential(`${this.username}_${this.bundleName}`, `email_${this.bundleName}`, this.emailInfo);
          }
          if (this.signature !== '') {
            await this.accountModel.setAccountCredential(`${this.username}_${this.bundleName}`, `signature_${this.bundleName}`, this.signature);
          }
          let res: RegExp = new RegExp(`^[a-zA-Z0-9_.-]+@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*\.[a-zA-Z0-9]{2,6}$`);
          let userPassWord: preferences.ValueType = await this.storage.getStorageValue(getContext(), this.username, this.bundleName);
          // 验证邮箱格式
          if (this.emailInfo !== '' && !res.test(this.emailInfo)) {
            AlertDialog.show(
              {
                message: $r('app.string.emailinfo'),
                confirm: {
                  value: $r('app.string.close'),
                  action: () => {
                    this.emailInfo = ''
                  }
                },
                cancel: () => {
                  Logger.info(TAG, `AlertDialog close`);
                }
              })
          } else if (this.passWord !== '' && this.passWord.length < 6) {
            AlertDialog.show(
              {
                message: $r('app.string.min_password'),
                confirm: {
                  value: $r('app.string.close'),
                  action: () => {
                    Logger.info(TAG, `AlertDialog enter`);
                  }
                },
                cancel: () => {
                  Logger.info(TAG, `AlertDialog close`);
                }
              })
          } else if (this.passWord !== '' && this.passWord === userPassWord) {
            AlertDialog.show(
              {
                message: $r('app.string.userpassword'),
                confirm: {
                  value: $r('app.string.close'),
                  action: () => {
                    Logger.info(TAG, `AlertDialog enter`);
                  }
                },
                cancel: () => {
                  Logger.info(TAG, `AlertDialog close`);
                }
              })
          } else if (this.confirmPassword !== this.passWord) {
            AlertDialog.show(
              {
                message: $r('app.string.password_error'),
                confirm: {
                  value: $r('app.string.close'),
                  action: () => {
                    Logger.info(TAG, `AlertDialog enter`);
                  }
                },
                cancel: () => {
                  Logger.info(TAG, `AlertDialog close`);
                }
              })
          } else if (this.passWord !== '' && this.confirmPassword !== '') {
            await this.storage.putStorageValue(getContext(), this.username, this.passWord, this.bundleName);
            let email = await this.getInfo('', `${this.username}_${this.bundleName}`, `email_${this.bundleName}`);
            let signature = await this.getInfo('', `${this.username}_${this.bundleName}`, `signature_${this.bundleName}`);
            AlertDialog.show(
              {
                message: $r('app.string.modify_info'),
                confirm: {
                  value: $r('app.string.close'),
                  action: () => {
                    router.replaceUrl({
                      url: 'pages/Account',
                      params: {
                        email: email,
                        signature: signature,
                        bundleName: this.bundleName,
                        username: this.username
                      }
                    })
                  }
                },
                cancel: () => {
                  Logger.info(TAG, `AlertDialog close`)
                }
              })
          }
          else {
            let email = await this.getInfo('', `${this.username}_${this.bundleName}`, `email_${this.bundleName}`);
            let signature = await this.getInfo('', `${this.username}_${this.bundleName}`, `signature_${this.bundleName}`);
            AlertDialog.show(
              {
                message: $r('app.string.modify_info'),
                confirm: {
                  value: $r('app.string.close'),
                  action: () => {
                    router.replaceUrl({
                      url: 'pages/Account',
                      params: {
                        email: email,
                        signature: signature,
                        bundleName: this.bundleName,
                        username: this.username
                      }
                    })
                  }
                },
                cancel: () => {
                  Logger.info(TAG, `AlertDialog close`);
                }
              })
          }
        })
    }
  }
}