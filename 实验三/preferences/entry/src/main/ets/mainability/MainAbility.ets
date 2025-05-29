import { UIAbility, AbilityConstant, Want } from '@kit.AbilityKit';
import { window } from '@kit.ArkUI';
import Logger from '../model/Logger';

// 定义日志标签，用于在日志输出时标识来源
const TAG: string = '[MainAbility]';

/**
 * MainAbility 类继承自 UIAbility，是应用的主要能力入口
 * 它的生命周期方法用于管理应用的创建、销毁以及前后台切换等状态
 */
export default class MainAbility extends UIAbility {
  /**
   * 在能力创建时调用
   * @param want - 应用启动时的参数，包含启动应用的相关信息
   * @param launchParam - 应用启动的附加参数，提供关于启动方式的信息
   */
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    Logger.info(TAG, 'MainAbility onCreate is called');
  }

  /**
   * 在能力销毁时调用
   */
  onDestroy() {
    Logger.info(TAG, 'MainAbility onDestroy is called');
  }

  /**
   * 在窗口期创建时调用
   * @param windowStage - 窗口期实例，用于管理应用的界面布局
   */
  onWindowStageCreate(windowStage: window.WindowStage): void {
    Logger.info(TAG, 'MainAbility onWindowStageCreate is called');
    // 加载页面内容，'pages/Index' 是要加载的页面路径
    windowStage.loadContent('pages/Index', (err, data) => {
      if (err.code) {
        // 如果加载失败，记录错误信息
        Logger.error(TAG, `Failed to load the content. Cause:${JSON.stringify(err) ?? ''}`);
        return;
      }
      // 如果加载成功，记录成功信息
      Logger.info(TAG, `Succeeded in loading the content. Data:${JSON.stringify(data) ?? ''}`);
    });
  }

  /**
   * 在窗口期销毁时调用
   */
  onWindowStageDestroy() {
    Logger.info(TAG, 'MainAbility onWindowStageDestroy is called');
  }

  /**
   * 当应用进入前台时调用
   */
  onForeground() {
    Logger.info(TAG, 'MainAbility onForeground is called');
  }

  /**
   * 当应用进入后台时调用
   */
  onBackground() {
    Logger.info(TAG, 'MainAbility onBackground is called');
  }
}
