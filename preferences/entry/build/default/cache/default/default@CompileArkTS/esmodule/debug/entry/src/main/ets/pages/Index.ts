if (!("finalizeConstruction" in ViewPU.prototype)) {
    Reflect.set(ViewPU.prototype, "finalizeConstruction", () => { });
}
interface Index_Params {
    nowTheme?: string;
    themeDatas?: Array<ImageAndName>;
}
import emitter from "@ohos:events.emitter";
import preferences from "@ohos:data.preferences";
import Logger from "@bundle:ohos.samples.preference/entry/ets/model/Logger";
import ThemeDesktop from "@bundle:ohos.samples.preference/entry/ets/common/ThemeDesktop";
export interface ImageAndName {
    image: Resource;
    name: ResourceStr;
}
const THEMES: Array<ImageAndName>[] = [
    [
        { image: { "id": 16777233, "type": 20000, params: [], "bundleName": "ohos.samples.preference", "moduleName": "entry" }, name: { "id": 16777222, "type": 10003, params: [], "bundleName": "ohos.samples.preference", "moduleName": "entry" } },
        { image: { "id": 16777248, "type": 20000, params: [], "bundleName": "ohos.samples.preference", "moduleName": "entry" }, name: { "id": 16777227, "type": 10003, params: [], "bundleName": "ohos.samples.preference", "moduleName": "entry" } },
        { image: { "id": 16777238, "type": 20000, params: [], "bundleName": "ohos.samples.preference", "moduleName": "entry" }, name: { "id": 16777225, "type": 10003, params: [], "bundleName": "ohos.samples.preference", "moduleName": "entry" } },
        { image: { "id": 16777247, "type": 20000, params: [], "bundleName": "ohos.samples.preference", "moduleName": "entry" }, name: { "id": 16777226, "type": 10003, params: [], "bundleName": "ohos.samples.preference", "moduleName": "entry" } },
        { image: { "id": 16777230, "type": 20000, params: [], "bundleName": "ohos.samples.preference", "moduleName": "entry" }, name: { "id": 16777221, "type": 10003, params: [], "bundleName": "ohos.samples.preference", "moduleName": "entry" } },
        { image: { "id": 16777234, "type": 20000, params: [], "bundleName": "ohos.samples.preference", "moduleName": "entry" }, name: { "id": 16777220, "type": 10003, params: [], "bundleName": "ohos.samples.preference", "moduleName": "entry" } },
        { image: { "id": 16777237, "type": 20000, params: [], "bundleName": "ohos.samples.preference", "moduleName": "entry" }, name: { "id": 16777224, "type": 10003, params: [], "bundleName": "ohos.samples.preference", "moduleName": "entry" } },
        { image: { "id": 16777257, "type": 20000, params: [], "bundleName": "ohos.samples.preference", "moduleName": "entry" }, name: { "id": 16777228, "type": 10003, params: [], "bundleName": "ohos.samples.preference", "moduleName": "entry" } },
    ],
    [
        { image: { "id": 16777249, "type": 20000, params: [], "bundleName": "ohos.samples.preference", "moduleName": "entry" }, name: { "id": 16777222, "type": 10003, params: [], "bundleName": "ohos.samples.preference", "moduleName": "entry" } },
        { image: { "id": 16777255, "type": 20000, params: [], "bundleName": "ohos.samples.preference", "moduleName": "entry" }, name: { "id": 16777227, "type": 10003, params: [], "bundleName": "ohos.samples.preference", "moduleName": "entry" } },
        { image: { "id": 16777252, "type": 20000, params: [], "bundleName": "ohos.samples.preference", "moduleName": "entry" }, name: { "id": 16777225, "type": 10003, params: [], "bundleName": "ohos.samples.preference", "moduleName": "entry" } },
        { image: { "id": 16777254, "type": 20000, params: [], "bundleName": "ohos.samples.preference", "moduleName": "entry" }, name: { "id": 16777226, "type": 10003, params: [], "bundleName": "ohos.samples.preference", "moduleName": "entry" } },
        { image: { "id": 16777250, "type": 20000, params: [], "bundleName": "ohos.samples.preference", "moduleName": "entry" }, name: { "id": 16777221, "type": 10003, params: [], "bundleName": "ohos.samples.preference", "moduleName": "entry" } },
        { image: { "id": 16777253, "type": 20000, params: [], "bundleName": "ohos.samples.preference", "moduleName": "entry" }, name: { "id": 16777220, "type": 10003, params: [], "bundleName": "ohos.samples.preference", "moduleName": "entry" } },
        { image: { "id": 16777251, "type": 20000, params: [], "bundleName": "ohos.samples.preference", "moduleName": "entry" }, name: { "id": 16777224, "type": 10003, params: [], "bundleName": "ohos.samples.preference", "moduleName": "entry" } },
        { image: { "id": 16777256, "type": 20000, params: [], "bundleName": "ohos.samples.preference", "moduleName": "entry" }, name: { "id": 16777228, "type": 10003, params: [], "bundleName": "ohos.samples.preference", "moduleName": "entry" } },
    ],
    [
        { image: { "id": 16777239, "type": 20000, params: [], "bundleName": "ohos.samples.preference", "moduleName": "entry" }, name: { "id": 16777222, "type": 10003, params: [], "bundleName": "ohos.samples.preference", "moduleName": "entry" } },
        { image: { "id": 16777245, "type": 20000, params: [], "bundleName": "ohos.samples.preference", "moduleName": "entry" }, name: { "id": 16777227, "type": 10003, params: [], "bundleName": "ohos.samples.preference", "moduleName": "entry" } },
        { image: { "id": 16777242, "type": 20000, params: [], "bundleName": "ohos.samples.preference", "moduleName": "entry" }, name: { "id": 16777225, "type": 10003, params: [], "bundleName": "ohos.samples.preference", "moduleName": "entry" } },
        { image: { "id": 16777244, "type": 20000, params: [], "bundleName": "ohos.samples.preference", "moduleName": "entry" }, name: { "id": 16777226, "type": 10003, params: [], "bundleName": "ohos.samples.preference", "moduleName": "entry" } },
        { image: { "id": 16777240, "type": 20000, params: [], "bundleName": "ohos.samples.preference", "moduleName": "entry" }, name: { "id": 16777221, "type": 10003, params: [], "bundleName": "ohos.samples.preference", "moduleName": "entry" } },
        { image: { "id": 16777243, "type": 20000, params: [], "bundleName": "ohos.samples.preference", "moduleName": "entry" }, name: { "id": 16777220, "type": 10003, params: [], "bundleName": "ohos.samples.preference", "moduleName": "entry" } },
        { image: { "id": 16777241, "type": 20000, params: [], "bundleName": "ohos.samples.preference", "moduleName": "entry" }, name: { "id": 16777224, "type": 10003, params: [], "bundleName": "ohos.samples.preference", "moduleName": "entry" } },
        { image: { "id": 16777246, "type": 20000, params: [], "bundleName": "ohos.samples.preference", "moduleName": "entry" }, name: { "id": 16777228, "type": 10003, params: [], "bundleName": "ohos.samples.preference", "moduleName": "entry" } },
    ]
];
const TAG: string = '[Index]';
const PREFERENCES_NAME = 'theme.db';
const THEME_NAMES: string[] = ['default', 'simplicity', 'pomeloWhtie'];
let preferenceTheme: preferences.Preferences | null = null;
class Index extends ViewPU {
    constructor(parent, params, __localStorage, elmtId = -1, paramsLambda = undefined, extraInfo) {
        super(parent, __localStorage, elmtId, extraInfo);
        if (typeof paramsLambda === "function") {
            this.paramsGenerator_ = paramsLambda;
        }
        this.__nowTheme = new ObservedPropertySimplePU('', this, "nowTheme");
        this.__themeDatas = new ObservedPropertyObjectPU([], this, "themeDatas");
        this.setInitiallyProvidedValue(params);
        this.finalizeConstruction();
    }
    setInitiallyProvidedValue(params: Index_Params) {
        if (params.nowTheme !== undefined) {
            this.nowTheme = params.nowTheme;
        }
        if (params.themeDatas !== undefined) {
            this.themeDatas = params.themeDatas;
        }
    }
    updateStateVars(params: Index_Params) {
    }
    purgeVariableDependenciesOnElmtId(rmElmtId) {
        this.__nowTheme.purgeDependencyOnElmtId(rmElmtId);
        this.__themeDatas.purgeDependencyOnElmtId(rmElmtId);
    }
    aboutToBeDeleted() {
        this.__nowTheme.aboutToBeDeleted();
        this.__themeDatas.aboutToBeDeleted();
        SubscriberManager.Get().delete(this.id__());
        this.aboutToBeDeletedInternal();
    }
    private __nowTheme: ObservedPropertySimplePU<string>;
    get nowTheme() {
        return this.__nowTheme.get();
    }
    set nowTheme(newValue: string) {
        this.__nowTheme.set(newValue);
    }
    private __themeDatas: ObservedPropertyObjectPU<Array<ImageAndName>>;
    get themeDatas() {
        return this.__themeDatas.get();
    }
    set themeDatas(newValue: Array<ImageAndName>) {
        this.__themeDatas.set(newValue);
    }
    async aboutToAppear() {
        // Retrieve lightweight storage db files from memory.
        await this.getPreferencesFromStorage();
        // Retrieve the key value with the name 'theme' from the lightweight storage db file.
        this.nowTheme = await this.getPreference();
        console.info(`nowTheme__get ${this.nowTheme}`);
        emitter.emit({ eventId: 0, priority: 0 }, {
            data: {
                nowTheme: this.nowTheme
            }
        });
        let index = THEME_NAMES.indexOf(this.nowTheme);
        this.themeDatas = THEMES[index];
    }
    async getPreferencesFromStorage() {
        let context = getContext(this) as Context;
        preferenceTheme = await preferences.getPreferences(context, PREFERENCES_NAME);
    }
    async putPreference(data: string) {
        Logger.info(TAG, `Put begin`);
        if (preferenceTheme !== null) {
            await preferenceTheme.put('theme', data);
            await preferenceTheme.flush();
        }
    }
    async getPreference(): Promise<string> {
        Logger.info(TAG, `Get begin`);
        let theme: string = '';
        if (preferenceTheme !== null) {
            theme = await preferenceTheme.get('theme', 'default') as string;
            return theme;
        }
        return theme;
    }
    changeTheme(themeNum: number) {
        this.themeDatas = THEMES[themeNum];
        this.putPreference(THEME_NAMES[themeNum]);
    }
    initialRender() {
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Column.create();
            Column.width('100%');
            Column.height('100%');
        }, Column);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Row.create();
            Row.width('100%');
            Row.height(50);
            Row.backgroundColor('#0D9FFB');
        }, Row);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Text.create({ "id": 16777219, "type": 10003, params: [], "bundleName": "ohos.samples.preference", "moduleName": "entry" });
            Text.fontSize(25);
            Text.layoutWeight(5);
            Text.padding({ left: 10 });
            Text.fontColor(Color.White);
            Text.fontWeight(FontWeight.Bold);
        }, Text);
        Text.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Image.create({ "id": 16777231, "type": 20000, params: [], "bundleName": "ohos.samples.preference", "moduleName": "entry" });
            Image.key('changeBtn');
            Image.id('changeBtn');
            Image.height(30);
            Image.layoutWeight(1);
            Image.objectFit(ImageFit.ScaleDown);
            Image.bindMenu([
                {
                    value: THEME_NAMES[0],
                    action: () => {
                        this.changeTheme(0);
                    }
                },
                {
                    value: THEME_NAMES[1],
                    action: () => {
                        this.changeTheme(1);
                    }
                },
                {
                    value: THEME_NAMES[2],
                    action: () => {
                        this.changeTheme(2);
                    }
                }
            ]);
        }, Image);
        Row.pop();
        {
            this.observeComponentCreation2((elmtId, isInitialRender) => {
                if (isInitialRender) {
                    let componentCall = new ThemeDesktop(this, { themeDatas: this.__themeDatas }, undefined, elmtId, () => { }, { page: "entry/src/main/ets/pages/Index.ets", line: 152, col: 7 });
                    ViewPU.create(componentCall);
                    let paramsLambda = () => {
                        return {
                            themeDatas: this.themeDatas
                        };
                    };
                    componentCall.paramsGenerator_ = paramsLambda;
                }
                else {
                    this.updateStateVarsOfChildByElmtId(elmtId, {});
                }
            }, { name: "ThemeDesktop" });
        }
        Column.pop();
    }
    rerender() {
        this.updateDirtyElements();
    }
    static getEntryName(): string {
        return "Index";
    }
}
registerNamedRoute(() => new Index(undefined, {}), "", { bundleName: "ohos.samples.preference", moduleName: "entry", pagePath: "pages/Index", pageFullPath: "entry/src/main/ets/pages/Index", integratedHsp: "false", moduleType: "followWithHap" });
