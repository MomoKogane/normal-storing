import { router } from '@kit.ArkUI';

/**
 * BasicDataSource类是数据源的基础实现，提供了数据管理的基本方法
 * 它实现了IDataSource接口，提供了一个基本的数据操作框架
 */
class BasicDataSource implements IDataSource {
  // 存储数据变更监听器的数组
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
   * @param {DataChangeListener} listener 数据变更监听器
   */
  registerDataChangeListener(listener: DataChangeListener) {
    if (this.listeners.indexOf(listener) < 0) {
      this.listeners.push(listener);
    }
  }

  /**
   * 注销数据变更监听器
   * @param {DataChangeListener} listener 数据变更监听器
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
   * @param {number} index 添加的数据索引
   */
  notifyDataAdd(index: number) {
    this.listeners.forEach(listener => {
      listener.onDataAdd(index);
    })
  }

  /**
   * 通知所有监听器数据已变更
   * @param {number} index 变更的数据索引
   */
  notifyDataChange(index: number) {
    this.listeners.forEach(listener => {
      listener.onDataChange(index);
    })
  }

  /**
   * 通知所有监听器数据已删除
   * @param {number} index 删除的数据索引
   */
  notifyDataDelete(index: number) {
    this.listeners.forEach(listener => {
      listener.onDataDelete(index);
    })
  }

  /**
   * 通知所有监听器数据已移动
   * @param {number} from 数据移动的起始索引
   * @param {number} to 数据移动的目标索引
   */
  notifyDataMove(from: number, to: number) {
    this.listeners.forEach(listener => {
      listener.onDataMove(from, to);
    })
  }
}

/**
 * DataArray类定义了数据项的结构，包括图片、文本和名称字段
 */
class DataArray {
  img: Resource = $r('app.string.empty');
  text: Resource = $r('app.string.empty');
  name: string = '';
}

/**
 * MyDataSource类继承自BasicDataSource，提供了具体的数据源实现
 */
class MyDataSource extends BasicDataSource {
  // 存储数据项的数组
  private dataArray: Array<DataArray> = [
    { img: $r('app.media.music'), text: $r('app.string.music'), name: 'Music' },
    { img: $r('app.media.video'), text: $r('app.string.video'), name: 'Video' },
    { img: $r('app.media.map'), text: $r('app.string.map'), name: 'Map' }
  ]

  /**
   * 返回数据总数
   * @returns {number} 数据总数
   */
  public totalCount() {
    return this.dataArray.length;
  }

  /**
   * 根据索引获取数据
   * @param {number} index 数据索引
   * @returns {DataArray} 数据项
   */
  public getData(index: number){
    return this.dataArray[index];
  }

  /**
   * 在指定索引处添加数据项
   * @param {number} index 添加数据的索引
   */
  public addData(index: number) {
    this.dataArray.splice(index, 0);
    this.notifyDataAdd(index);
  }

  /**
   * 在数据末尾添加数据项
   * @param {number} index 添加数据的索引
   */
  public pushData(index: number) {
    this.dataArray.push();
    this.notifyDataAdd(this.dataArray.length - 1);
  }

  /**
   * 替换整个数据集
   * @param {DataArray[]} result 新的数据集
   */
  public replaceData(result: DataArray[]) {
    this.dataArray = result;
  }
}

/**
 * BundleInfo组件展示了数据源中的数据项
 * 它使用LazyForEach组件来遍历数据源，并为每个数据项创建一个Row组件
 */
@Component
export struct BundleInfo {
  // 数据源实例
  @State dataSet: MyDataSource = new MyDataSource();

  build() {
    Column() {
      LazyForEach(this.dataSet, (item: DataArray) => {
        Row() {
          Image(item.img)
            .margin(10)
            .width('40%')
            .height('60%')
            .objectFit(ImageFit.Contain)

          Text(item.text)
            .margin(10)
            .fontSize(20)

          Image($r('app.media.right'))
            .margin(10)
            .width('15%')
            .height('20%')
            .layoutWeight(1)
            .objectFit(ImageFit.Contain)
        }
        .id(item.name + 'App')
        .margin(5)
        .width('95%')
        .height('20%')
        .borderRadius(20)
        .backgroundColor('#f6f6f6')
        .onClick(() => {
          router.replaceUrl({
            url: 'pages/Login',
            params: {
              bundleName: item.name
            }
          })
        })
      }, (item: DataArray) => item.name.toString())
    }
    .layoutWeight(1)
  }
}
