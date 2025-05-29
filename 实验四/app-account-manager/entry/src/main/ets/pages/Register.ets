import { router } from '@kit.ArkUI';
import { RegisterInfo } from '../common/RegisterInfo';
import { NavigationBar } from '../common/NavigationBar';

/**
 * 注册页面组件
 * 该组件是用户注册流程的入口，负责展示注册页面的布局和内容
 */
@Entry
@Component
struct Register {
  // 当前bundle的名称，通过路由参数获取
  @State bundleName: string = (router.getParams() as Record<string, string>)['bundleName'];

  /**
   * 构建注册页面的UI
   * 页面主要由滚动视图和列布局组成，包含导航栏和注册信息输入部分
   */
  build() {
    Scroll() {
      Column() {
        // 导航栏，包含返回登录页面的功能和当前页面标题
        NavigationBar({ title: $r('app.string.register'), flag: true, url: 'pages/Login', bundleName: this.bundleName })

        // 注册信息输入部分，用于用户输入注册所需信息
        RegisterInfo({ bundleName: this.bundleName })
      }
    }
  }
}
