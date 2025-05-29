import { router } from '@kit.ArkUI';
import Logger from '../model/Logger';

// 定义日志标签，用于在日志中标识导航栏组件
const TAG: string = '[NavigationBar]';

// 使用@Component装饰器标记NavigationBar为组件
@Component
export struct NavigationBar {
  // 导航栏组件的私有属性定义
  private url: string = '';
  private username: string = '';
  private bundleName: string = '';
  private flag: boolean = false;
  private title: Resource = $r('app.string.empty');
  private email: string = '';
  private signature: string = '';

  // 组件的构建方法，用于定义组件的UI结构
  build() {
    // 导航栏整体布局采用Row布局，根据flag的值决定是否显示后退按钮和标题
    Row() {
      // 根据flag的值决定是否显示后退按钮和标题
      if (this.flag) {
        // 显示后退按钮和标题的布局
        Row() {
          // 后退按钮的布局
          Row() {
            Image($r('app.media.left'))
              .objectFit(ImageFit.Contain)
              .width('10%')
            Text($r('app.string.back'))
              .fontSize(18)
              .textAlign(TextAlign.End)
              .fontColor(Color.White)
          }
          .id('back')
          .layoutWeight(1)
          .onClick(() => {
            // 点击后退按钮时显示确认对话框
            AlertDialog.show(
              {
                title: $r('app.string.warning'),
                message: $r('app.string.routerback'),
                primaryButton: {
                  value: $r('app.string.confirm'),
                  action: () => {
                    // 确认后退时，使用router进行页面跳转
                    router.replaceUrl({
                      url: this.url,
                      params: {
                        bundleName: this.bundleName,
                        username: this.username,
                        email: this.email,
                        signature: this.signature
                      }
                    })
                  }
                },
                secondaryButton: {
                  value: $r('app.string.cancel'),
                  action: () => {
                    // 取消后退时，记录日志
                    Logger.info(TAG, `AlertDialog enter`);
                  }
                },
                cancel: () => {
                  // 关闭对话框时，记录日志
                  Logger.info(TAG, `AlertDialog close`);
                }
              })
          })

          // 标题的布局
          Text(this.title)
            .fontSize(18)
            .fontColor(Color.White)
            .textAlign(TextAlign.Start)
            .margin({ right: '5%' })
        }
        .height('8%')
        .width('100%')
        .padding({ left: 15 })
        .backgroundColor('#0D9FFB')
        .constraintSize({ minHeight: 50 })
      } else {
        // 不显示后退按钮时，标题居中显示
        Row() {
          Text(this.title)
            .fontSize(18)
            .fontColor(Color.White)
            .textAlign(TextAlign.Center)
        }
        .height('8%')
        .width('100%')
        .padding({ left: 15 })
        .backgroundColor('#0D9FFB')
        .constraintSize({ minHeight: 50 })
      }
    }
  }
}
