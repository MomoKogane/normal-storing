// Import necessary modules and classes
import { UIAbility, AbilityConstant, Want } from '@kit.AbilityKit'
import { window } from '@kit.ArkUI'
import Logger from '../model/Logger';

// Define a constant for log tag
const TAG: string = '[Index]';

// Define an EntryAbility class, inheriting from UIAbility
export default class EntryAbility extends UIAbility {
  // Called when the Ability is created
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    // Log the creation parameters of the Ability
    Logger.info(TAG, `Ability onCreate want param: ` + JSON.stringify(want) ?? '' + 'launchParam:' + JSON.stringify(launchParam) ?? '');
  }

  // Called when the Ability is destroyed
  onDestroy(): void {
    // Log the destruction of the Ability
    Logger.info(TAG, `Ability onDestroy`);
  }

  // Called when the main window is created
  onWindowStageCreate(windowStage: window.WindowStage): void {
    // Main window is created, set main page for this ability
    Logger.info(TAG, `Ability onWindowStageCreate`);

    // Load the main page content
    windowStage.loadContent('pages/Index', (err, data) => {
      if (err.code) {
        // Log error if loading fails
        Logger.error(TAG, 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
        return;
      }
      // Log success if loading succeeds
      Logger.info(TAG, 'Succeeded in loading the content. Data: %{public}s', JSON.stringify(data) ?? '');
    });
  }

  // Called when the main window is destroyed
  onWindowStageDestroy(): void {
    // Main window is destroyed, release UI related resources
    Logger.info(TAG, 'Ability onWindowStageDestroy');
  }

  // Called when the Ability is brought to the foreground
  onForeground(): void {
    // Ability has brought to foreground
    Logger.info(TAG, 'Ability onForeground');
  }

  // Called when the Ability is moved to the background
  onBackground(): void {
    // Ability has back to background
    Logger.info(TAG, 'Ability onBackground');
  }
}
