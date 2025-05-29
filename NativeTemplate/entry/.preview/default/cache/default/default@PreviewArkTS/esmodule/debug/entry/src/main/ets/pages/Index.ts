if (!("finalizeConstruction" in ViewPU.prototype)) {
    Reflect.set(ViewPU.prototype, "finalizeConstruction", () => { });
}
interface NativeTemplate_Params {
    result?: string;
    numX?: number;
    numY?: number;
    numZ?: number;
    textInputControllerX?: TextInputController;
    textInputControllerY?: TextInputController;
    textInputControllerZ?: TextInputController;
}
import libHello from "@app:com.example.nativetemplatedemo/entry/hello";
import CommonContants from "@bundle:com.example.nativetemplatedemo/entry/src/main/common/CommonContants";
class NativeTemplate extends ViewPU {
    constructor(parent, params, __localStorage, elmtId = -1, paramsLambda = undefined, extraInfo) {
        super(parent, __localStorage, elmtId, extraInfo);
        if (typeof paramsLambda === "function") {
            this.paramsGenerator_ = paramsLambda;
        }
        this.__result = new ObservedPropertySimplePU('0', this, "result");
        this.__numX = new ObservedPropertySimplePU(0.0, this, "numX");
        this.__numY = new ObservedPropertySimplePU(0.0, this, "numY");
        this.__numZ = new ObservedPropertySimplePU(0.0, this, "numZ");
        this.textInputControllerX = new TextInputController();
        this.textInputControllerY = new TextInputController();
        this.textInputControllerZ = new TextInputController();
        this.setInitiallyProvidedValue(params);
        this.finalizeConstruction();
    }
    setInitiallyProvidedValue(params: NativeTemplate_Params) {
        if (params.result !== undefined) {
            this.result = params.result;
        }
        if (params.numX !== undefined) {
            this.numX = params.numX;
        }
        if (params.numY !== undefined) {
            this.numY = params.numY;
        }
        if (params.numZ !== undefined) {
            this.numZ = params.numZ;
        }
        if (params.textInputControllerX !== undefined) {
            this.textInputControllerX = params.textInputControllerX;
        }
        if (params.textInputControllerY !== undefined) {
            this.textInputControllerY = params.textInputControllerY;
        }
        if (params.textInputControllerZ !== undefined) {
            this.textInputControllerZ = params.textInputControllerZ;
        }
    }
    updateStateVars(params: NativeTemplate_Params) {
    }
    purgeVariableDependenciesOnElmtId(rmElmtId) {
        this.__result.purgeDependencyOnElmtId(rmElmtId);
        this.__numX.purgeDependencyOnElmtId(rmElmtId);
        this.__numY.purgeDependencyOnElmtId(rmElmtId);
        this.__numZ.purgeDependencyOnElmtId(rmElmtId);
    }
    aboutToBeDeleted() {
        this.__result.aboutToBeDeleted();
        this.__numX.aboutToBeDeleted();
        this.__numY.aboutToBeDeleted();
        this.__numZ.aboutToBeDeleted();
        SubscriberManager.Get().delete(this.id__());
        this.aboutToBeDeletedInternal();
    }
    private __result: ObservedPropertySimplePU<string>;
    get result() {
        return this.__result.get();
    }
    set result(newValue: string) {
        this.__result.set(newValue);
    }
    private __numX: ObservedPropertySimplePU<number>;
    get numX() {
        return this.__numX.get();
    }
    set numX(newValue: number) {
        this.__numX.set(newValue);
    }
    private __numY: ObservedPropertySimplePU<number>;
    get numY() {
        return this.__numY.get();
    }
    set numY(newValue: number) {
        this.__numY.set(newValue);
    }
    private __numZ: ObservedPropertySimplePU<number>;
    get numZ() {
        return this.__numZ.get();
    }
    set numZ(newValue: number) {
        this.__numZ.set(newValue);
    }
    private textInputControllerX: TextInputController;
    private textInputControllerY: TextInputController;
    private textInputControllerZ: TextInputController;
    initialRender() {
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Column.create();
            Column.debugLine("entry/src/main/ets/pages/Index.ets(16:5)", "entry");
            Column.width(CommonContants.FULL_PARENT);
            Column.height(CommonContants.FULL_PARENT);
            Column.backgroundColor({ "id": 16777264, "type": 10001, params: [], "bundleName": "com.example.nativetemplatedemo", "moduleName": "entry" });
        }, Column);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Row.create();
            Row.debugLine("entry/src/main/ets/pages/Index.ets(17:7)", "entry");
            Row.height({ "id": 16777261, "type": 10002, params: [], "bundleName": "com.example.nativetemplatedemo", "moduleName": "entry" });
            Row.width(CommonContants.FULL_PARENT);
            Row.padding({
                left: { "id": 16777251, "type": 10002, params: [], "bundleName": "com.example.nativetemplatedemo", "moduleName": "entry" },
                right: { "id": 16777251, "type": 10002, params: [], "bundleName": "com.example.nativetemplatedemo", "moduleName": "entry" },
                top: { "id": 16777252, "type": 10002, params: [], "bundleName": "com.example.nativetemplatedemo", "moduleName": "entry" }
            });
        }, Row);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Text.create({ "id": 16777230, "type": 10003, params: [], "bundleName": "com.example.nativetemplatedemo", "moduleName": "entry" });
            Text.debugLine("entry/src/main/ets/pages/Index.ets(18:9)", "entry");
            Text.fontSize({ "id": 16777263, "type": 10002, params: [], "bundleName": "com.example.nativetemplatedemo", "moduleName": "entry" });
            Text.fontWeight(CommonContants.FONT_WEIGHT);
            Text.height({ "id": 16777262, "type": 10002, params: [], "bundleName": "com.example.nativetemplatedemo", "moduleName": "entry" });
            Text.align(Alignment.Center);
            Text.maxLines(CommonContants.MAX_LINES);
            Text.textOverflow({ overflow: TextOverflow.Ellipsis });
        }, Text);
        Text.pop();
        Row.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Row.create();
            Row.debugLine("entry/src/main/ets/pages/Index.ets(34:7)", "entry");
            Row.height({ "id": 16777241, "type": 10002, params: [], "bundleName": "com.example.nativetemplatedemo", "moduleName": "entry" });
            Row.width(CommonContants.FULL_PARENT);
            Row.padding({ left: { "id": 16777251, "type": 10002, params: [], "bundleName": "com.example.nativetemplatedemo", "moduleName": "entry" }, right: { "id": 16777251, "type": 10002, params: [], "bundleName": "com.example.nativetemplatedemo", "moduleName": "entry" } });
            Row.justifyContent(FlexAlign.Start);
            Row.alignItems(VerticalAlign.Bottom);
        }, Row);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Text.create({ "id": 16777226, "type": 10003, params: [], "bundleName": "com.example.nativetemplatedemo", "moduleName": "entry" });
            Text.debugLine("entry/src/main/ets/pages/Index.ets(35:9)", "entry");
            Text.fontSize({ "id": 16777239, "type": 10002, params: [], "bundleName": "com.example.nativetemplatedemo", "moduleName": "entry" });
            Text.fontWeight(CommonContants.FONT_WEIGHT);
            Text.height({ "id": 16777242, "type": 10002, params: [], "bundleName": "com.example.nativetemplatedemo", "moduleName": "entry" });
            Text.align(Alignment.Center);
            Text.maxLines(CommonContants.MAX_LINES);
            Text.textOverflow({ overflow: TextOverflow.Ellipsis });
        }, Text);
        Text.pop();
        Row.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Column.create();
            Column.debugLine("entry/src/main/ets/pages/Index.ets(49:7)", "entry");
            Column.margin({ "id": 16777238, "type": 10002, params: [], "bundleName": "com.example.nativetemplatedemo", "moduleName": "entry" });
            Column.borderRadius({ "id": 16777236, "type": 10002, params: [], "bundleName": "com.example.nativetemplatedemo", "moduleName": "entry" });
            Column.height({ "id": 16777237, "type": 10002, params: [], "bundleName": "com.example.nativetemplatedemo", "moduleName": "entry" });
            Column.backgroundColor(Color.White);
        }, Column);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Row.create();
            Row.debugLine("entry/src/main/ets/pages/Index.ets(50:9)", "entry");
            Row.height({ "id": 16777257, "type": 10002, params: [], "bundleName": "com.example.nativetemplatedemo", "moduleName": "entry" });
            Row.justifyContent(FlexAlign.End);
            Row.alignItems(VerticalAlign.Bottom);
            Row.width(CommonContants.FULL_PARENT);
            Row.padding({
                bottom: { "id": 16777259, "type": 10002, params: [], "bundleName": "com.example.nativetemplatedemo", "moduleName": "entry" },
                right: { "id": 16777260, "type": 10002, params: [], "bundleName": "com.example.nativetemplatedemo", "moduleName": "entry" }
            });
        }, Row);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Text.create({ "id": 16777228, "type": 10003, params: [], "bundleName": "com.example.nativetemplatedemo", "moduleName": "entry" });
            Text.debugLine("entry/src/main/ets/pages/Index.ets(51:11)", "entry");
            Text.height({ "id": 16777258, "type": 10002, params: [], "bundleName": "com.example.nativetemplatedemo", "moduleName": "entry" });
            Text.fontColor({ "id": 16777266, "type": 10001, params: [], "bundleName": "com.example.nativetemplatedemo", "moduleName": "entry" });
            Text.fontSize({ "id": 16777256, "type": 10002, params: [], "bundleName": "com.example.nativetemplatedemo", "moduleName": "entry" });
        }, Text);
        Text.pop();
        Row.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Row.create();
            Row.debugLine("entry/src/main/ets/pages/Index.ets(65:9)", "entry");
            Row.height({ "id": 16777245, "type": 10002, params: [], "bundleName": "com.example.nativetemplatedemo", "moduleName": "entry" });
            Row.padding({ right: { "id": 16777246, "type": 10002, params: [], "bundleName": "com.example.nativetemplatedemo", "moduleName": "entry" } });
            Row.width(CommonContants.FULL_PARENT);
            Row.justifyContent(FlexAlign.End);
        }, Row);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Text.create(this.result);
            Text.debugLine("entry/src/main/ets/pages/Index.ets(66:11)", "entry");
            Text.textAlign(TextAlign.End);
            Text.fontColor(Color.Black);
            Text.fontSize({ "id": 16777244, "type": 10002, params: [], "bundleName": "com.example.nativetemplatedemo", "moduleName": "entry" });
            Text.width(CommonContants.FULL_PARENT);
            Text.height(CommonContants.FULL_PARENT);
            Text.textOverflow({ overflow: TextOverflow.Clip });
        }, Text);
        Text.pop();
        Row.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Row.create();
            Row.debugLine("entry/src/main/ets/pages/Index.ets(79:9)", "entry");
            Row.height({ "id": 16777232, "type": 10002, params: [], "bundleName": "com.example.nativetemplatedemo", "moduleName": "entry" });
            Row.width(CommonContants.FULL_PARENT);
            Row.justifyContent(FlexAlign.Center);
            Row.margin({ top: { "id": 16777233, "type": 10002, params: [], "bundleName": "com.example.nativetemplatedemo", "moduleName": "entry" } });
        }, Row);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Button.createWithLabel({ "id": 16777229, "type": 10003, params: [], "bundleName": "com.example.nativetemplatedemo", "moduleName": "entry" });
            Button.debugLine("entry/src/main/ets/pages/Index.ets(80:11)", "entry");
            Button.fontSize({ "id": 16777248, "type": 10002, params: [], "bundleName": "com.example.nativetemplatedemo", "moduleName": "entry" });
            Button.fontWeight(CommonContants.FONT_WEIGHT);
            Button.height(CommonContants.FULL_PARENT);
            Button.width({ "id": 16777234, "type": 10002, params: [], "bundleName": "com.example.nativetemplatedemo", "moduleName": "entry" });
            Button.onClick(() => {
                //this.result = libHello.mySort(this.numX, this.numY, this.numZ);
                const raw = libHello.mySort(this.numX, this.numY, this.numZ);
                // 处理结果格式：去除前后括号，取整，拼接
                const parts = raw.replace(/^\[|\]$/g, '').split(',');
                this.result = parts.map(n => Math.floor(Number(n))).join(', ');
            });
        }, Button);
        Button.pop();
        Row.pop();
        Column.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Row.create();
            Row.debugLine("entry/src/main/ets/pages/Index.ets(104:7)", "entry");
            Row.height({ "id": 16777253, "type": 10002, params: [], "bundleName": "com.example.nativetemplatedemo", "moduleName": "entry" });
            Row.margin({ top: { "id": 16777235, "type": 10002, params: [], "bundleName": "com.example.nativetemplatedemo", "moduleName": "entry" } });
            Row.padding({ left: { "id": 16777250, "type": 10002, params: [], "bundleName": "com.example.nativetemplatedemo", "moduleName": "entry" }, right: { "id": 16777250, "type": 10002, params: [], "bundleName": "com.example.nativetemplatedemo", "moduleName": "entry" } });
            Row.width(CommonContants.FULL_PARENT);
            Row.justifyContent(FlexAlign.Start);
        }, Row);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Text.create({ "id": 16777224, "type": 10003, params: [], "bundleName": "com.example.nativetemplatedemo", "moduleName": "entry" });
            Text.debugLine("entry/src/main/ets/pages/Index.ets(105:9)", "entry");
            Text.fontColor(Color.Black);
            Text.fontSize({ "id": 16777243, "type": 10002, params: [], "bundleName": "com.example.nativetemplatedemo", "moduleName": "entry" });
            Text.height({ "id": 16777254, "type": 10002, params: [], "bundleName": "com.example.nativetemplatedemo", "moduleName": "entry" });
        }, Text);
        Text.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            TextInput.create({ controller: this.textInputControllerX });
            TextInput.debugLine("entry/src/main/ets/pages/Index.ets(109:9)", "entry");
            TextInput.type(InputType.Number);
            TextInput.height(CommonContants.FULL_PARENT);
            TextInput.margin({ left: { "id": 16777249, "type": 10002, params: [], "bundleName": "com.example.nativetemplatedemo", "moduleName": "entry" } });
            TextInput.layoutWeight(CommonContants.TEXTINPUT_LAYOUT_WEIGHT);
            TextInput.onChange(value => {
                this.numX = Number.parseFloat(value);
            });
        }, TextInput);
        Row.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Row.create();
            Row.debugLine("entry/src/main/ets/pages/Index.ets(124:7)", "entry");
            Row.height({ "id": 16777253, "type": 10002, params: [], "bundleName": "com.example.nativetemplatedemo", "moduleName": "entry" });
            Row.margin({ top: { "id": 16777247, "type": 10002, params: [], "bundleName": "com.example.nativetemplatedemo", "moduleName": "entry" } });
            Row.padding({ left: { "id": 16777250, "type": 10002, params: [], "bundleName": "com.example.nativetemplatedemo", "moduleName": "entry" }, right: { "id": 16777250, "type": 10002, params: [], "bundleName": "com.example.nativetemplatedemo", "moduleName": "entry" } });
            Row.width(CommonContants.FULL_PARENT);
            Row.justifyContent(FlexAlign.Start);
        }, Row);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Text.create({ "id": 16777225, "type": 10003, params: [], "bundleName": "com.example.nativetemplatedemo", "moduleName": "entry" });
            Text.debugLine("entry/src/main/ets/pages/Index.ets(125:9)", "entry");
            Text.fontColor(Color.Black);
            Text.fontSize({ "id": 16777243, "type": 10002, params: [], "bundleName": "com.example.nativetemplatedemo", "moduleName": "entry" });
            Text.height({ "id": 16777254, "type": 10002, params: [], "bundleName": "com.example.nativetemplatedemo", "moduleName": "entry" });
        }, Text);
        Text.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            TextInput.create({ controller: this.textInputControllerY });
            TextInput.debugLine("entry/src/main/ets/pages/Index.ets(130:9)", "entry");
            TextInput.type(InputType.Number);
            TextInput.height(CommonContants.FULL_PARENT);
            TextInput.margin({ left: { "id": 16777249, "type": 10002, params: [], "bundleName": "com.example.nativetemplatedemo", "moduleName": "entry" } });
            TextInput.layoutWeight(CommonContants.TEXTINPUT_LAYOUT_WEIGHT);
            TextInput.onChange(value => {
                this.numY = Number.parseFloat(value);
            });
        }, TextInput);
        Row.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Row.create();
            Row.debugLine("entry/src/main/ets/pages/Index.ets(145:7)", "entry");
            Row.height({ "id": 16777253, "type": 10002, params: [], "bundleName": "com.example.nativetemplatedemo", "moduleName": "entry" });
            Row.margin({ top: { "id": 16777247, "type": 10002, params: [], "bundleName": "com.example.nativetemplatedemo", "moduleName": "entry" } });
            Row.padding({ left: { "id": 16777250, "type": 10002, params: [], "bundleName": "com.example.nativetemplatedemo", "moduleName": "entry" }, right: { "id": 16777250, "type": 10002, params: [], "bundleName": "com.example.nativetemplatedemo", "moduleName": "entry" } });
            Row.width(CommonContants.FULL_PARENT);
            Row.justifyContent(FlexAlign.Start);
        }, Row);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Text.create({ "id": 16777268, "type": 10003, params: [], "bundleName": "com.example.nativetemplatedemo", "moduleName": "entry" });
            Text.debugLine("entry/src/main/ets/pages/Index.ets(146:9)", "entry");
            Text.fontColor(Color.Black);
            Text.fontSize({ "id": 16777243, "type": 10002, params: [], "bundleName": "com.example.nativetemplatedemo", "moduleName": "entry" });
            Text.height({ "id": 16777254, "type": 10002, params: [], "bundleName": "com.example.nativetemplatedemo", "moduleName": "entry" });
        }, Text);
        Text.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            TextInput.create({ controller: this.textInputControllerZ });
            TextInput.debugLine("entry/src/main/ets/pages/Index.ets(151:9)", "entry");
            TextInput.type(InputType.Number);
            TextInput.height(CommonContants.FULL_PARENT);
            TextInput.margin({ left: { "id": 16777249, "type": 10002, params: [], "bundleName": "com.example.nativetemplatedemo", "moduleName": "entry" } });
            TextInput.layoutWeight(CommonContants.TEXTINPUT_LAYOUT_WEIGHT);
            TextInput.onChange(value => {
                this.numZ = Number.parseFloat(value);
            });
        }, TextInput);
        Row.pop();
        Column.pop();
    }
    rerender() {
        this.updateDirtyElements();
    }
    static getEntryName(): string {
        return "NativeTemplate";
    }
}
registerNamedRoute(() => new NativeTemplate(undefined, {}), "", { bundleName: "com.example.nativetemplatedemo", moduleName: "entry", pagePath: "pages/Index", pageFullPath: "entry/src/main/ets/pages/Index", integratedHsp: "false", moduleType: "followWithHap" });
