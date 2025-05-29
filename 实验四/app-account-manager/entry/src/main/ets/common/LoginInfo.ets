import { router } from '@kit.ArkUI';
import Logger from '../model/Logger';
import { AccountData } from '../model/AccountData';
import { AccountModel } from '../model/AccountModel';
import { preferences } from '@kit.ArkData';

// 定义日志标签，用于在日志输出时标识来源
const TAG: string = '[LoginInfo]';

// 使用@Component装饰器标记LoginInfo结构体为组件
@Component
export struct LoginInfo {
  // 使用@State装饰器标记name和password为组件状态
  @State name: string = '';
  @State password: string = '';
  // 使用@Prop装饰器标记bundleName为组件属性
  @Prop bundleName: string;
  // 初始化AccountData和AccountModel实例
  private storage: AccountData = new AccountData();
  private accountModel: AccountModel = new AccountModel();

  // 构建组件UI
  build() {
    Column() {
      // 显示应用名称和bundleName
      Row() {
        Text($r('app.string.appname'))
          .margin(10)
          .fontSize(18)
          .width('20%')
          .textAlign(TextAlign.End)
        Text(this.bundleName)
          .margin(10)
          .width('55%')
          .fontSize(20)
          .textAlign(TextAlign.Center)
      }
      .margin({ top: '10%' })
      .padding({ left: 5 })

      // 用户名输入框
      Row() {
        Text($r('app.string.username'))
          .margin(10)
          .fontSize(18)
          .width('20%')
          .textAlign(TextAlign.End)

        TextInput({ placeholder: 'xxxxxxx' })
          .id('nameInput')
          .margin(10)
          .width('55%')
          .fontSize(20)
          .maxLength(20)
          .fontWeight(FontWeight.Bold)
          .placeholderFont({ size: 16, weight: FontWeight.Normal })
          .onChange((value: string) => {
            this.name = value;
          })
      }
      .padding({ left: 5 })

      // 密码输入框
      Row() {
        Text($r('app.string.password'))
          .margin(10)
          .fontSize(18)
          .width('20%')
          .textAlign(TextAlign.End)

        TextInput({ placeholder: 'xxxxxxx' })
          .id('passwordInput')
          .margin(10)
          .width('55%')
          .fontSize(20)
          .maxLength(20)
          .type(InputType.Password)
          .fontWeight(FontWeight.Bold)
          .placeholderFont({ size: 16, weight: FontWeight.Normal })
          .onChange((value: string) => {
            this.password = value;
          })
      }
      .padding({ left: 5 })

      // 注册按钮
      Button($r('app.string.register'))
        .id('register')
        .margin(10)
        .width('60%')
        .fontSize(20)
        .fontColor(Color.White)
        .type(ButtonType.Capsule)
        .onClick(() => {
          router.replaceUrl({
            url: 'pages/Register',
            params: {
              bundleName: this.bundleName
            }
          })
        })

      // 登录按钮
      Button($r('app.string.login'))
        .id('login')
        .margin(10)
        .width('60%')
        .fontSize(20)
        .fontColor(Color.White)
        .type(ButtonType.Capsule)
        .onClick(async () => {
          // 从存储中获取用户密码和登录效果
          let result: preferences.ValueType = await this.storage.getStorageValue(getContext(), this.name, this.bundleName);
          let effect: preferences.ValueType = await this.storage.getStorageValue(getContext(), this.bundleName, `${this.name}_${this.bundleName}`);
          // 校验用户名和密码
          if (this.name === '') {
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
          } else if (this.password === '') {
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
          } else if (result === this.password && effect === 'true') {
            // 获取账户凭证
            let email: string = '';
            let signature: string = '';
            try {
              email = await this.accountModel.getAccountCredential(`${this.name}_${this.bundleName}`, `email_${this.bundleName}`);
              Logger.info(TAG, `getAccountCredential email is ${email}`);
            } catch (err) {
              email = '';
              Logger.info(TAG, `getAccountCredential failed err is ${JSON.stringify(err)}`);
            }
            try {
              signature = await this.accountModel.getAccountCredential(`${this.name}_${this.bundleName}`, `signature_${this.bundleName}`);
              Logger.info(TAG, `getAccountCredential signature is ${signature}`);
            } catch (err) {
              signature = '';
              Logger.info(TAG, `getAccountCredential failed err is ${JSON.stringify(err)}`);
            }
            // 登录成功，跳转到账户页面
            router.replaceUrl({
              url: 'pages/Account',
              params: {
                email: email,
                username: this.name,
                signature: signature,
                bundleName: this.bundleName
              }
            })
          } else {
            AlertDialog.show(
              {
                message: $r('app.string.password_message'),
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
          }
        })
    }
  }
}
