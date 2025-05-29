// 导入路由模块，用于处理页面跳转和获取传递参数
import { router } from '@kit.ArkUI';
// 导入修改信息组件，用于用户修改个人信息
import { ModifyInfo } from '../common/ModifyInfo';
// 导入导航栏组件，用于展示页面导航信息
import { NavigationBar } from '../common/NavigationBar';

// 定义一个入口组件Modify，用于用户修改个人信息页面
@Entry
@Component
struct Modify {
  // 从路由参数中获取用户名，用于展示和修改
  @State username: string = (router.getParams() as Record<string, string>)['username'];
  // 从路由参数中获取bundle名称，用于展示和修改
  @State bundleName: string = (router.getParams() as Record<string, string>)['bundleName'];
  // 从路由参数中获取邮箱，用于展示和修改
  @State email: string = (router.getParams() as Record<string, string>)['email'];
  // 从路由参数中获取个性签名，用于展示和修改
  @State signature: string = (router.getParams() as Record<string, string>)['signature'];

  // 构建组件界面
  build() {
    // 使用Scroll组件包裹以实现滚动功能
    Scroll() {
      // 列布局，用于垂直排列子组件
      Column() {
        // 导航栏组件，展示页面标题和返回按钮
        NavigationBar({
          title: $r('app.string.modify'),
          flag: true,
          url: 'pages/Account',
          username: this.username,
          bundleName: this.bundleName,
          email: this.email,
          signature: this.signature
        })

        // 修改信息组件，用于用户输入和修改个人信息
        ModifyInfo({ bundleName: this.bundleName, username: this.username })
      }
    }
  }
}
