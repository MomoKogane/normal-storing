// 导入路由模块，用于处理页面跳转和参数传递
import { router } from '@kit.ArkUI';
// 导入AccountInfo组件，用于展示账户信息
import { AccountInfo } from '../common/AccountInfo';
// 导入NavigationBar组件，用于展示导航栏
import { NavigationBar } from '../common/NavigationBar';

// 定义一个入口组件Account，用于展示账户页面
@Entry
@Component
struct Account {
  // 初始化状态变量email，从路由参数中获取
  @State email: string = (router.getParams() as Record<string, string>)['email'];
  // 初始化状态变量username，从路由参数中获取
  @State username: string = (router.getParams() as Record<string, string>)['username'];
  // 初始化状态变量signature，从路由参数中获取
  @State signature: string = (router.getParams() as Record<string, string>)['signature'];
  // 初始化状态变量bundleName，从路由参数中获取
  @State bundleName: string = (router.getParams() as Record<string, string>)['bundleName'];

  // 构建组件的方法
  build() {
    // 创建一个列布局，包含导航栏和账户信息
    Column() {
      // 导航栏组件，设置标题和不显示返回按钮
      NavigationBar({ title: $r('app.string.account'), flag: false })

      // 账户信息组件，传入从路由参数中获取的数据
      AccountInfo({
        email: this.email,
        username: this.username,
        signature: this.signature,
        bundleName: this.bundleName
      })
    }
    // 设置列布局的宽度和高度为100%，以充满整个屏幕
    .width('100%')
    .height('100%')
  }
}
