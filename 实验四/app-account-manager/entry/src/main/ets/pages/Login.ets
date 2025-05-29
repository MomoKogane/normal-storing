import { router } from '@kit.ArkUI';
import { LoginInfo } from '../common/LoginInfo';
import { NavigationBar } from '../common/NavigationBar';

/**
 * 登录组件入口
 * 该组件负责处理用户的登录逻辑，并展示登录界面
 */
@Entry
@Component
struct Login {
  // 当前bundle的名称，通过路由参数获取
  @State bundleName: string = (router.getParams() as Record<string, string>)['bundleName'];

  /**
   * 构建登录界面的UI
   * 包含导航栏和登录信息输入部分
   */
  build() {
    Column() {
      // 导航栏，包含页面标题和返回首页的链接
      NavigationBar({ title: $r('app.string.register_login'), flag: true, url: 'pages/Index' })

      // 登录信息输入部分，传入bundleName作为参数
      LoginInfo({ bundleName: this.bundleName })
    }
    .width('100%')
    .height('100%')
  }
}
