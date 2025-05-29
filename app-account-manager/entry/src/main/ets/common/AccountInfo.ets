import { router } from '@kit.ArkUI';
import Logger from '../model/Logger';
import { AccountData } from '../model/AccountData';
import { AccountModel } from '../model/AccountModel';

// 定义日志标签，用于日志输出时标识来源
const TAG: string = '[AccountInfo]';

// 使用@Component装饰器标记AccountInfo结构体为组件
@Component
export struct AccountInfo {
  // 使用@Prop装饰器标记以下属性为组件的属性
  @Prop email: string;
  @Prop username: string;
  @Prop signature: string;
  @Prop bundleName: string;
  // 创建AccountData实例用于数据存储操作
  private storage: AccountData = new AccountData();
  // 创建AccountModel实例用于账户相关操作
  private accountModel: AccountModel = new AccountModel();

  // 定义信息展示构建器，用于构建展示标题和值的行
  @Builder infoShow(title: Resource, value: string) {
    Row() {
      Text(title)
        .margin(10)
        .fontSize(18)
        .width('25%')
        .textAlign(TextAlign.End)
      Text(value)
        .margin(10)
        .width('55%')
        .fontSize(20)
        .textAlign(TextAlign.Start)
    }
    .padding({ left: 5 })
  }

  // 定义组件构建方法，用于构建组件的UI
  build() {
    Scroll() {
      Column() {
        // 使用infoShow构建器展示账户信息
        this.infoShow($r('app.string.appname'), this.bundleName)
        this.infoShow($r('app.string.unusername'), this.username)
        this.infoShow($r('app.string.email'), this.email)
        this.infoShow($r('app.string.signature'), this.signature)

        // 修改按钮，点击后跳转到修改页面
        Button($r('app.string.modify'))
          .id('modify')
          .margin(10)
          .width('60%')
          .fontSize(20)
          .fontColor(Color.White)
          .type(ButtonType.Capsule)
          .onClick(() => {
            router.replaceUrl({
              url: 'pages/Modify',
              params: {
                username: this.username,
                bundleName: this.bundleName,
                email: this.email,
                signature: this.signature
              }
            })
          })

        // 申请按钮，点击后显示确认对话框
        Button($r('app.string.application'))
          .id('application')
          .margin(10)
          .width('60%')
          .fontSize(20)
          .fontColor(Color.White)
          .type(ButtonType.Capsule)
          .onClick(() => {
            AlertDialog.show(
              {
                title: $r('app.string.warning'),
                message: $r('app.string.switch_app'),
                primaryButton: {
                  value: $r('app.string.confirm'),
                  action: () => {
                    router.replaceUrl({
                      url: 'pages/Index'
                    })
                  }
                },
                secondaryButton: {
                  value: $r('app.string.cancel'),
                  action: () => {
                    Logger.info(TAG, `AlertDialog enter`);
                  }
                },
                cancel: () => {
                  Logger.info(TAG, `AlertDialog close`);
                }
              })
          })

        // 删除按钮，点击后显示确认对话框
        Button($r('app.string.delete'))
          .id('delete')
          .margin(10)
          .width('60%')
          .fontSize(20)
          .fontColor(Color.White)
          .type(ButtonType.Capsule)
          .onClick(() => {
            AlertDialog.show(
              {
                title: $r('app.string.warning'),
                message: $r('app.string.delete_account'),
                primaryButton: {
                  value: $r('app.string.confirm'),
                  action: () => {
                    // 删除账户并清除存储的数据，然后跳转到登录页面
                    this.accountModel.deleteAccount(`${this.username}_${this.bundleName}`);
                    this.storage.deleteStorageValue(getContext(), this.username, this.bundleName);
                    router.replaceUrl({
                      url: 'pages/Login',
                      params: {
                        bundleName: this.bundleName
                      }
                    })
                  }
                },
                secondaryButton: {
                  value: $r('app.string.cancel'),
                  action: () => {
                    Logger.info(TAG, `AlertDialog enter`);
                  }
                },
                cancel: () => {
                  Logger.info(TAG, `AlertDialog close`);
                }
              })
          })
      }
      .width('100%')
      .height('100%')
      .layoutWeight(1)
    }
  }
}
