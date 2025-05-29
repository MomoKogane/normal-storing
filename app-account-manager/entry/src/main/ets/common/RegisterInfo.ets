import { router } from '@kit.ArkUI';
import Logger from '../model/Logger';
import { AccountData } from '../model/AccountData';
import { AccountModel } from '../model/AccountModel';

/**
 * BasicDataSource 类提供了一个基本的数据源框架，用于管理数据和监听器
 */
class BasicDataSource implements IDataSource {
  private listeners: DataChangeListener[] = [];

  /**
   * 返回数据总数
   * @returns {number} 数据总数
   */
  public totalCount() {
    return 0;
  }

  /**
   * 根据索引获取数据
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
   * 注销数据变更监听器
   * @param {DataChangeListener} listener 监听器实例
   */
  unregisterDataChangeListener(listener: DataChangeListener) {
    const pos = this.listeners.indexOf(listener)
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
 * DataArray 类定义了数据项的结构
 */
class DataArray {
  text: Resource = $r('app.string.empty');
  inputType: InputType = InputType.Normal;
  length: number = 0;
  event: number = 0;
  inputFilter: string = '';
  promptText: Resource = $r('app.string.empty');
}

/**
 * MyDataSource 类继承自 BasicDataSource，并实现了具体的数据管理逻辑
 */
class MyDataSource extends BasicDataSource {
  private dataArray: Array<DataArray> = [
    // 定义了一系列数据项，每个数据项都有特定的结构和用途
    {
      text: $r('app.string.username'),
      inputType: InputType.Normal,
      length: 15,
      event: 0,
      inputFilter: '^[A-Za-z0-9_]+$',
      promptText: $r('app.string.prompt_username')
    },
    // 其他数据项省略...
  ]

  public totalCount() {
    return this.dataArray.length;
  }

  public getData(index: number) {
    return this.dataArray[index];
  }

  /**
   * 在指定索引处添加数据项
   * @param {number} index 要添加数据项的位置索引
   */
  public addData(index: number) {
    this.dataArray.splice(index, 0);
    this.notifyDataAdd(index);
  }

  /**
   * 在数据项末尾添加数据
   * @param {number} index 被操作的数据项索引
   */
  public pushData(index: number) {
    this.dataArray.push();
    this.notifyDataAdd(this.dataArray.length - 1);
  }

  /**
   * 替换全部数据项
   * @param {DataArray[]} result 新的数据项数组
   */
  public replaceData(result: DataArray[]) {
    this.dataArray = result;
  }
}

const TAG: string = '[RegisterInfo]';

/**
 * RegisterInfo 组件用于用户注册界面，管理用户的输入并进行表单验证
 */
@Component
export struct RegisterInfo {
  @State passWord: string = '';
  @State username: string = '';
  @State emailInfo: string = '';
  @State signature: string = '';
  @State confirmPassword: string = '';
  @State dataSet: MyDataSource = new MyDataSource();
  private bundleName: string = '';
  private storage: AccountData = new AccountData();
  private accountModel: AccountModel = new AccountModel();

  /**
   * 构建组件界面
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
          .margin(10)
          .width('55%')
          .fontSize(20)
          .textAlign(TextAlign.Center)
      }
      .margin(5)

      // 遍历数据项，生成输入表单
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
              .id('Register' + (index + 1))
              .margin(10)
              .width('55%')
              .fontSize(20)
              .maxLength(20)
              .type(item.inputType)
              .maxLength(item.length)
              .inputFilter(item.inputFilter)
              .fontWeight(FontWeight.Bold)
              .placeholderFont({ size: 16, weight: FontWeight.Normal })
              .onChange(async (value: string) => {
                // 根据不同的数据项处理用户的输入
                switch (item.event) {
                  case 0:
                    this.username = value
                    break
                  // 其他情况省略...
                }
              })
          }
        }
        .margin(5)
      }, (item: DataArray) => JSON.stringify(item))

      // 注册按钮，验证用户输入并进行注册操作
      Button($r('app.string.setting'))
        .id('complete')
        .margin(10)
        .width('60%')
        .fontSize(20)
        .fontColor(Color.White)
        .type(ButtonType.Capsule)
        .onClick(async () => {
          // 验证用户输入的合法性
          let res: RegExp = new RegExp(`^[a-zA-Z0-9_.-]+@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*\.[a-zA-Z0-9]{2,6}`);
          let result: boolean = await this.storage.hasStorageValue(getContext(), this.username, this.bundleName);
          Logger.info(TAG, `This result is ${result}`);
          // 根据不同的验证结果给出提示
          if (this.username === '') {
            AlertDialog.show(
              {
                message: $r('app.string.blank'),
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
          } else if (result) {
            AlertDialog.show(
              {
                message: $r('app.string.has'),
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
          } else if (this.emailInfo !== '' && !res.test(this.emailInfo)) {
            AlertDialog.show(
              {
                message: $r('app.string.emailinfo'),
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
          } else if (this.passWord === '') {
            AlertDialog.show(
              {
                message: $r('app.string.password_blank'),
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
          } else {
            // 保存用户数据并跳转到登录页面
            if (this.username !== '') {
              await this.accountModel.addAccount(`${this.username}_${this.bundleName}`);
            }
            if (this.emailInfo !== '') {
              await this.accountModel.setAccountCredential(`${this.username}_${this.bundleName}`, `email_${this.bundleName}`, this.emailInfo);
            }
            if (this.signature !== '') {
              await this.accountModel.setAccountCredential(`${this.username}_${this.bundleName}`, `signature_${this.bundleName}`, this.signature);
            }
            await this.accountModel.setAssociatedData(`${this.username}_${this.bundleName}`, `key_${this.bundleName}`, this.passWord);
            await this.storage.putStorageValue(getContext(), this.username, this.passWord, this.bundleName);
            await this.storage.putStorageValue(getContext(), this.bundleName, 'true', `${this.username}_${this.bundleName}`);
            AlertDialog.show(
              {
                message: $r('app.string.register_info'),
                confirm: {
                  value: $r('app.string.close'),
                  action: () => {
                    router.replaceUrl({
                      url: 'pages/Login',
                      params: {
                        bundleName: this.bundleName
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
