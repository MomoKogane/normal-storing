if (!("finalizeConstruction" in ViewPU.prototype)) {
    Reflect.set(ViewPU.prototype, "finalizeConstruction", () => { });
}
interface ThemeDesktop_Params {
    themeDatas?: Array<ImageAndName>;
}
import type { ImageAndName } from '../pages/Index';
export default class ThemeDesktop extends ViewPU {
    constructor(parent, params, __localStorage, elmtId = -1, paramsLambda = undefined, extraInfo) {
        super(parent, __localStorage, elmtId, extraInfo);
        if (typeof paramsLambda === "function") {
            this.paramsGenerator_ = paramsLambda;
        }
        this.__themeDatas = new SynchedPropertyObjectTwoWayPU(params.themeDatas, this, "themeDatas");
        this.setInitiallyProvidedValue(params);
        this.finalizeConstruction();
    }
    setInitiallyProvidedValue(params: ThemeDesktop_Params) {
    }
    updateStateVars(params: ThemeDesktop_Params) {
    }
    purgeVariableDependenciesOnElmtId(rmElmtId) {
        this.__themeDatas.purgeDependencyOnElmtId(rmElmtId);
    }
    aboutToBeDeleted() {
        this.__themeDatas.aboutToBeDeleted();
        SubscriberManager.Get().delete(this.id__());
        this.aboutToBeDeletedInternal();
    }
    private __themeDatas: SynchedPropertySimpleOneWayPU<Array<ImageAndName>>;
    get themeDatas() {
        return this.__themeDatas.get();
    }
    set themeDatas(newValue: Array<ImageAndName>) {
        this.__themeDatas.set(newValue);
    }
    initialRender() {
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Grid.create();
            Grid.rowsGap(10);
            Grid.width('100%');
            Grid.columnsGap(10);
            Grid.layoutWeight(1);
            Grid.padding({ top: 20 });
            Grid.backgroundColor('#e5e5e5');
            Grid.columnsTemplate('1fr 1fr 1fr 1fr');
        }, Grid);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            ForEach.create();
            const forEachItemGenFunction = _item => {
                const item = _item;
                {
                    const itemCreation2 = (elmtId, isInitialRender) => {
                        GridItem.create(() => { }, false);
                    };
                    const observedDeepRender = () => {
                        this.observeComponentCreation2(itemCreation2, GridItem);
                        this.observeComponentCreation2((elmtId, isInitialRender) => {
                            Column.create();
                            Column.width(90);
                            Column.height(90);
                        }, Column);
                        this.observeComponentCreation2((elmtId, isInitialRender) => {
                            Image.create(item.image);
                            Image.width(70);
                            Image.height(70);
                            Image.padding(10);
                            Image.objectFit(ImageFit.Fill);
                        }, Image);
                        this.observeComponentCreation2((elmtId, isInitialRender) => {
                            Text.create(item.name);
                            Text.fontSize(15);
                        }, Text);
                        Text.pop();
                        Column.pop();
                        GridItem.pop();
                    };
                    observedDeepRender();
                }
            };
            this.forEachUpdateFunction(elmtId, this.themeDatas, forEachItemGenFunction, (item: ImageAndName) => JSON.stringify(item), false, false);
        }, ForEach);
        ForEach.pop();
        Grid.pop();
    }
    rerender() {
        this.updateDirtyElements();
    }
}
