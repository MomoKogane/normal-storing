import { ImageAndName } from '../pages/Index';

/**
 * 主题桌面组件，用于展示主题数据
 */
@Component
export default struct ThemeDesktop {
  /**
   * 主题数据数组，包含图像和名称
   */
  @Link themeDatas: Array<ImageAndName>;

  /**
   * 构建组件的结构
   * 使用Grid布局来展示主题数据，每个主题数据包含一个图像和一个名称
   */
  build() {
    Grid() {
      // 遍历主题数据数组，为每个主题数据创建一个GridItem
      ForEach(this.themeDatas, (item: ImageAndName) => {
        GridItem() {
          Column() {
            // 显示主题的图像，设置图像的宽度、高度和对齐方式
            Image(item.image)
              .width(70)
              .height(70)
              .padding(10)
              .objectFit(ImageFit.Fill)
            // 显示主题的名称，设置文本的字体大小
            Text(item.name).fontSize(15)
          }
          .width(90)
          .height(90)
        }
      }, (item: ImageAndName) => JSON.stringify(item))
    }
    .rowsGap(10)
    .width('100%')
    .columnsGap(10)
    .layoutWeight(1)
    .padding({ top: 20 })
    .backgroundColor('#e5e5e5')
    .columnsTemplate('1fr 1fr 1fr 1fr')
  }
}
