/**
 * BasicDataSource类提供了数据源的基本功能，允许注册数据变更监听器，并在数据变更时通知这些监听器
 * 它实现了一个基本的数据源接口，用于提供数据项的数量和获取特定索引的数据项
 */
class BasicDataSource implements IDataSource {
  // 存储注册的数据变更监听器
  private listeners: DataChangeListener[] = []

  /**
   * 返回数据源中的数据项总数
   * @returns {number} 数据项的总数
   */
  public totalCount() {
    return 0
  }

  /**
   * 获取指定索引处的数据项
   * @param {number} index 数据项的索引
   * @returns 数据项
   */
  public getData(index: number) {
  }

  /**
   * 注册一个数据变更监听器，如果该监听器尚未注册的话
   * @param {DataChangeListener} listener 要注册的监听器
   */
  registerDataChangeListener(listener: DataChangeListener) {
    if (this.listeners.indexOf(listener) < 0) {
      this.listeners.push(listener)
    }
  }

  /**
   * 取消注册一个数据变更监听器
   * @param {DataChangeListener} listener 要取消注册的监听器
   */
  unregisterDataChangeListener(listener: DataChangeListener) {
    const pos = this.listeners.indexOf(listener)
    if (pos >= 0) {
      this.listeners.splice(pos, 1)
    }
  }

  /**
   * 通知所有注册的监听器数据已重新加载
   */
  notifyDataReload() {
    this.listeners.forEach(listener => {
      listener.onDataReloaded()
    })
  }

  /**
   * 通知所有注册的监听器数据已添加
   * @param {number} index 添加数据的索引
   */
  notifyDataAdd(index: number) {
    this.listeners.forEach(listener => {
      listener.onDataAdd(index)
    })
  }

  /**
   * 通知所有注册的监听器数据已变更
   * @param {number} index 变更数据的索引
   */
  notifyDataChange(index: number) {
    this.listeners.forEach(listener => {
      listener.onDataChange(index)
    })
  }

  /**
   * 通知所有注册的监听器数据已删除
   * @param {number} index 删除数据的索引
   */
  notifyDataDelete(index: number) {
    this.listeners.forEach(listener => {
      listener.onDataDelete(index)
    })
  }

  /**
   * 通知所有注册的监听器数据已移动
   * @param {number} from 数据移动的起始索引
   * @param {number} to 数据移动的目标索引
   */
  notifyDataMove(from: number, to: number) {
    this.listeners.forEach(listener => {
      listener.onDataMove(from, to)
    })
  }
}

/**
 * MyDataSource类继承自BasicDataSource，具体实现了数据源的功能
 * 它管理一个数据数组，提供数据项的总数，获取特定索引的数据项，并在数据变更时通知监听器
 */
export class MyDataSource extends BasicDataSource {
  // 存储数据的数组
  private dataArray: number[] = []

  /**
   * 构造函数，初始化数据数组
   * @param {number[]} dataArray 初始化的数据数组
   */
  constructor(dataArray: number[]){
    super()
    this.dataArray = dataArray
  }

  /**
   * 重写totalCount方法，返回数据数组中的数据项总数
   * @returns {number} 数据项的总数
   */
  public totalCount() {
    return this.dataArray.length
  }

  /**
   * 重写getData方法，获取数据数组中指定索引处的数据项
   * @param {number} index 数据项的索引
   * @returns {number} 数据项
   */
  public getData(index: number): number {
    return this.dataArray[index]
  }

  /**
   * 在数据数组的指定位置添加一个数据项，并通知监听器
   * @param {number} index 要添加数据项的位置
   */
  public addData(index: number) {
    this.dataArray.splice(index, 0)
    this.notifyDataAdd(index)
  }

  /**
   * 在数据数组的末尾添加一个数据项，并通知监听器
   * @param {number} index 要添加的数据项
   */
  public pushData(index: number) {
    this.dataArray.push(index)
    this.notifyDataAdd(this.dataArray.length - 1)
  }

  /**
   * 替换整个数据数组，并通知监听器数据已重新加载
   * @param {number[]} result 新的数据数组
   */
  public replaceData(result: number[]) {
    this.dataArray = result
    this.notifyDataReload()
  }
}
