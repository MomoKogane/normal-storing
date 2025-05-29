// 导入BundleInfo组件，用于显示应用包信息
import { BundleInfo } from '../common/BundleInfo';
// 导入NavigationBar组件，用于创建导航栏
import { NavigationBar } from '../common/NavigationBar';

// 定义一个入口组件Index
@Entry
@Component
struct Index {
  // 构建组件的UI
  build() {
    // 使用Column布局来垂直排列子组件
    Column() {
      // 添加一个导航栏，设置标题和是否显示返回按钮
      NavigationBar({ title: $r('app.string.entry_MainAbility'), flag: false })

      // 显示应用包信息
      BundleInfo()
    }
    // 设置布局宽度为屏幕宽度
    .width('100%')
    // 设置布局高度为屏幕高度
    .height('100%')
  }
}
