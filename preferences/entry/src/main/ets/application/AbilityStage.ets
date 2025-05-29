// 导入AbilityStage模块，用于管理应用生命周期
import { AbilityStage } from '@kit.AbilityKit';
// 导入Logger类，用于日志记录
import Logger from '../model/Logger';

/**
 * 自定义应用生命周期管理类
 * 继承自AbilityStage，以重写生命周期方法
 */
export default class MyAbilityStage extends AbilityStage {
  /**
   * 应用创建时调用的方法
   * 记录应用创建日志，便于调试和追踪
   */
  onCreate() {
    Logger.info('[AbilityStage]', 'MyAbilityStage onCreate');
  }
}
