import UIAbility from "@ohos:app.ability.UIAbility";
import type AbilityConstant from "@ohos:app.ability.AbilityConstant";
import type Want from "@ohos:app.ability.Want";
import type window from "@ohos:window";
import Logger from "@bundle:ohos.samples.preference/entry/ets/model/Logger";
const TAG: string = '[MainAbility]';
export default class MainAbility extends UIAbility {
    onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
        Logger.info(TAG, 'MainAbility onCreate is called');
    }
    onDestroy() {
        Logger.info(TAG, 'MainAbility onDestroy is called');
    }
    onWindowStageCreate(windowStage: window.WindowStage): void {
        Logger.info(TAG, 'MainAbility onWindowStageCreate is called');
        windowStage.loadContent('pages/Index', (err, data) => {
            if (err.code) {
                Logger.error(TAG, `Failed to load the content. Cause:${JSON.stringify(err) ?? ''}`);
                return;
            }
            Logger.info(TAG, `Succeeded in loading the content. Data:${JSON.stringify(data) ?? ''}`);
        });
    }
    onWindowStageDestroy() {
        Logger.info(TAG, 'MainAbility onWindowStageDestroy is called');
    }
    onForeground() {
        Logger.info(TAG, 'MainAbility onForeground is called');
    }
    onBackground() {
        Logger.info(TAG, 'MainAbility onBackground is called');
    }
}
