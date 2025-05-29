import AbilityStage from "@ohos:app.ability.AbilityStage";
import Logger from "@bundle:ohos.samples.preference/entry/ets/model/Logger";
export default class MyAbilityStage extends AbilityStage {
    onCreate() {
        Logger.info('[AbilityStage]', 'MyAbilityStage onCreate');
    }
}
