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
    /**
     * 存储排序结果字符串，初始值为'0'
     * 用于绑定显示在结果文本区域
     */
    private __result: ObservedPropertySimplePU<string>;
    get result() {
        return this.__result.get();
    }
    set result(newValue: string) {
        this.__result.set(newValue);
    }
    /**
     * 存储用户输入的X数值，初始值为0.0
     * 与输入框X双向绑定
     */
    private __numX: ObservedPropertySimplePU<number>;
    get numX() {
        return this.__numX.get();
    }
    set numX(newValue: number) {
        this.__numX.set(newValue);
    }
    /**
     * 存储用户输入的Y数值，初始值为0.0
     * 与输入框Y双向绑定
     */
    private __numY: ObservedPropertySimplePU<number>;
    get numY() {
        return this.__numY.get();
    }
    set numY(newValue: number) {
        this.__numY.set(newValue);
    }
    /**
     * 存储用户输入的Z数值，初始值为0.0
     * 与输入框Z双向绑定
     */
    private __numZ: ObservedPropertySimplePU<number>;
    get numZ() {
        return this.__numZ.get();
    }
    set numZ(newValue: number) {
        this.__numZ.set(newValue);
    }
    /**
     * 输入框X的控制器，用于管理文本输入状态
     */
    private textInputControllerX: TextInputController;
    /**
     * 输入框Y的控制器，用于管理文本输入状态
     */
    private textInputControllerY: TextInputController;
    /**
     * 输入框Z的控制器，用于管理文本输入状态
     */
    private textInputControllerZ: TextInputController;
    initialRender() {
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            /**
             * 页面整体布局结构，采用垂直排列的Column容器
             * 包含标题、消息提示、功能区域和三个数值输入框
             */
            Column.create();
            /**
             * 页面整体布局结构，采用垂直排列的Column容器
             * 包含标题、消息提示、功能区域和三个数值输入框
             */
            Column.width(CommonContants.FULL_PARENT);
            /**
             * 页面整体布局结构，采用垂直排列的Column容器
             * 包含标题、消息提示、功能区域和三个数值输入框
             */
            Column.height(CommonContants.FULL_PARENT);
            /**
             * 页面整体布局结构，采用垂直排列的Column容器
             * 包含标题、消息提示、功能区域和三个数值输入框
             */
            Column.backgroundColor({ "id": 16777227, "type": 10001, params: [], "bundleName": "com.example.nativetemplatedemo", "moduleName": "entry" });
        }, Column);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            // 标题区域布局配置
            Row.create();
            // 标题区域布局配置
            Row.height({ "id": 16777259, "type": 10002, params: [], "bundleName": "com.example.nativetemplatedemo", "moduleName": "entry" });
            // 标题区域布局配置
            Row.width(CommonContants.FULL_PARENT);
            // 标题区域布局配置
            Row.padding({
                left: { "id": 16777249, "type": 10002, params: [], "bundleName": "com.example.nativetemplatedemo", "moduleName": "entry" },
                right: { "id": 16777249, "type": 10002, params: [], "bundleName": "com.example.nativetemplatedemo", "moduleName": "entry" },
                top: { "id": 16777250, "type": 10002, params: [], "bundleName": "com.example.nativetemplatedemo", "moduleName": "entry" }
            });
        }, Row);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Text.create({ "id": 16777226, "type": 10003, params: [], "bundleName": "com.example.nativetemplatedemo", "moduleName": "entry" });
            Text.fontSize({ "id": 16777261, "type": 10002, params: [], "bundleName": "com.example.nativetemplatedemo", "moduleName": "entry" });
            Text.fontWeight(CommonContants.FONT_WEIGHT);
            Text.height({ "id": 16777260, "type": 10002, params: [], "bundleName": "com.example.nativetemplatedemo", "moduleName": "entry" });
            Text.align(Alignment.Center);
            Text.maxLines(CommonContants.MAX_LINES);
            Text.textOverflow({ overflow: TextOverflow.Ellipsis });
        }, Text);
        Text.pop();
        // 标题区域布局配置
        Row.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            // 消息提示区域布局配置
            Row.create();
            // 消息提示区域布局配置
            Row.height({ "id": 16777239, "type": 10002, params: [], "bundleName": "com.example.nativetemplatedemo", "moduleName": "entry" });
            // 消息提示区域布局配置
            Row.width(CommonContants.FULL_PARENT);
            // 消息提示区域布局配置
            Row.padding({ left: { "id": 16777249, "type": 10002, params: [], "bundleName": "com.example.nativetemplatedemo", "moduleName": "entry" }, right: { "id": 16777249, "type": 10002, params: [], "bundleName": "com.example.nativetemplatedemo", "moduleName": "entry" } });
            // 消息提示区域布局配置
            Row.justifyContent(FlexAlign.Start);
            // 消息提示区域布局配置
            Row.alignItems(VerticalAlign.Bottom);
        }, Row);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Text.create({ "id": 16777222, "type": 10003, params: [], "bundleName": "com.example.nativetemplatedemo", "moduleName": "entry" });
            Text.fontSize({ "id": 16777237, "type": 10002, params: [], "bundleName": "com.example.nativetemplatedemo", "moduleName": "entry" });
            Text.fontWeight(CommonContants.FONT_WEIGHT);
            Text.height({ "id": 16777240, "type": 10002, params: [], "bundleName": "com.example.nativetemplatedemo", "moduleName": "entry" });
            Text.align(Alignment.Center);
            Text.maxLines(CommonContants.MAX_LINES);
            Text.textOverflow({ overflow: TextOverflow.Ellipsis });
        }, Text);
        Text.pop();
        // 消息提示区域布局配置
        Row.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            /**
             * 结果展示与操作区域布局
             * 包含结果提示标签、排序按钮和结果显示文本
             */
            Column.create();
            /**
             * 结果展示与操作区域布局
             * 包含结果提示标签、排序按钮和结果显示文本
             */
            Column.margin({ "id": 16777236, "type": 10002, params: [], "bundleName": "com.example.nativetemplatedemo", "moduleName": "entry" });
            /**
             * 结果展示与操作区域布局
             * 包含结果提示标签、排序按钮和结果显示文本
             */
            Column.borderRadius({ "id": 16777234, "type": 10002, params: [], "bundleName": "com.example.nativetemplatedemo", "moduleName": "entry" });
            /**
             * 结果展示与操作区域布局
             * 包含结果提示标签、排序按钮和结果显示文本
             */
            Column.height({ "id": 16777235, "type": 10002, params: [], "bundleName": "com.example.nativetemplatedemo", "moduleName": "entry" });
            /**
             * 结果展示与操作区域布局
             * 包含结果提示标签、排序按钮和结果显示文本
             */
            Column.backgroundColor(Color.White);
        }, Column);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Row.create();
            Row.height({ "id": 16777255, "type": 10002, params: [], "bundleName": "com.example.nativetemplatedemo", "moduleName": "entry" });
            Row.justifyContent(FlexAlign.End);
            Row.alignItems(VerticalAlign.Bottom);
            Row.width(CommonContants.FULL_PARENT);
            Row.padding({
                bottom: { "id": 16777257, "type": 10002, params: [], "bundleName": "com.example.nativetemplatedemo", "moduleName": "entry" },
                right: { "id": 16777258, "type": 10002, params: [], "bundleName": "com.example.nativetemplatedemo", "moduleName": "entry" }
            });
        }, Row);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Text.create({ "id": 16777224, "type": 10003, params: [], "bundleName": "com.example.nativetemplatedemo", "moduleName": "entry" });
            Text.height({ "id": 16777256, "type": 10002, params: [], "bundleName": "com.example.nativetemplatedemo", "moduleName": "entry" });
            Text.fontColor({ "id": 16777229, "type": 10001, params: [], "bundleName": "com.example.nativetemplatedemo", "moduleName": "entry" });
            Text.fontSize({ "id": 16777254, "type": 10002, params: [], "bundleName": "com.example.nativetemplatedemo", "moduleName": "entry" });
        }, Text);
        Text.pop();
        Row.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            /**
             * 按钮与结果文本布局
             * 实现按钮左对齐、结果文本右对齐的响应式布局
             */
            Row.create();
            /**
             * 按钮与结果文本布局
             * 实现按钮左对齐、结果文本右对齐的响应式布局
             */
            Row.height({ "id": 16777243, "type": 10002, params: [], "bundleName": "com.example.nativetemplatedemo", "moduleName": "entry" });
            /**
             * 按钮与结果文本布局
             * 实现按钮左对齐、结果文本右对齐的响应式布局
             */
            Row.width(CommonContants.FULL_PARENT);
            /**
             * 按钮与结果文本布局
             * 实现按钮左对齐、结果文本右对齐的响应式布局
             */
            Row.justifyContent(FlexAlign.SpaceBetween);
            /**
             * 按钮与结果文本布局
             * 实现按钮左对齐、结果文本右对齐的响应式布局
             */
            Row.alignItems(VerticalAlign.Bottom);
            /**
             * 按钮与结果文本布局
             * 实现按钮左对齐、结果文本右对齐的响应式布局
             */
            Row.margin({ top: { "id": 16777231, "type": 10002, params: [], "bundleName": "com.example.nativetemplatedemo", "moduleName": "entry" } });
        }, Row);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            /**
             * 排序按钮点击事件处理
             * 调用原生模块libhello.so的mySort函数进行排序
             * 处理返回的数组字符串并更新结果展示
             */
            Button.createWithLabel({ "id": 16777225, "type": 10003, params: [], "bundleName": "com.example.nativetemplatedemo", "moduleName": "entry" });
            /**
             * 排序按钮点击事件处理
             * 调用原生模块libhello.so的mySort函数进行排序
             * 处理返回的数组字符串并更新结果展示
             */
            Button.fontSize({ "id": 16777246, "type": 10002, params: [], "bundleName": "com.example.nativetemplatedemo", "moduleName": "entry" });
            /**
             * 排序按钮点击事件处理
             * 调用原生模块libhello.so的mySort函数进行排序
             * 处理返回的数组字符串并更新结果展示
             */
            Button.fontWeight(CommonContants.FONT_WEIGHT);
            /**
             * 排序按钮点击事件处理
             * 调用原生模块libhello.so的mySort函数进行排序
             * 处理返回的数组字符串并更新结果展示
             */
            Button.height(CommonContants.FULL_PARENT);
            /**
             * 排序按钮点击事件处理
             * 调用原生模块libhello.so的mySort函数进行排序
             * 处理返回的数组字符串并更新结果展示
             */
            Button.width({ "id": 16777232, "type": 10002, params: [], "bundleName": "com.example.nativetemplatedemo", "moduleName": "entry" });
            /**
             * 排序按钮点击事件处理
             * 调用原生模块libhello.so的mySort函数进行排序
             * 处理返回的数组字符串并更新结果展示
             */
            Button.onClick(() => {
                const raw = libHello.mySort(this.numX, this.numY, this.numZ);
                const parts = raw.replace(/^\[|\]$/g, '').split(',');
                this.result = parts.map(n => Math.floor(Number(n))).join(', ');
            });
        }, Button);
        /**
         * 排序按钮点击事件处理
         * 调用原生模块libhello.so的mySort函数进行排序
         * 处理返回的数组字符串并更新结果展示
         */
        Button.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            // 结果文本展示配置
            Text.create(this.result);
            // 结果文本展示配置
            Text.textAlign(TextAlign.End);
            // 结果文本展示配置
            Text.fontColor(Color.Black);
            // 结果文本展示配置
            Text.fontSize({ "id": 16777242, "type": 10002, params: [], "bundleName": "com.example.nativetemplatedemo", "moduleName": "entry" });
            // 结果文本展示配置
            Text.layoutWeight(1);
            // 结果文本展示配置
            Text.height(CommonContants.FULL_PARENT);
            // 结果文本展示配置
            Text.textOverflow({ overflow: TextOverflow.Clip });
            // 结果文本展示配置
            Text.padding({ right: { "id": 16777244, "type": 10002, params: [], "bundleName": "com.example.nativetemplatedemo", "moduleName": "entry" } });
        }, Text);
        // 结果文本展示配置
        Text.pop();
        /**
         * 按钮与结果文本布局
         * 实现按钮左对齐、结果文本右对齐的响应式布局
         */
        Row.pop();
        /**
         * 结果展示与操作区域布局
         * 包含结果提示标签、排序按钮和结果显示文本
         */
        Column.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            /**
             * X值输入区域布局
             * 包含提示文本和数字输入框
             */
            Row.create();
            /**
             * X值输入区域布局
             * 包含提示文本和数字输入框
             */
            Row.height({ "id": 16777251, "type": 10002, params: [], "bundleName": "com.example.nativetemplatedemo", "moduleName": "entry" });
            /**
             * X值输入区域布局
             * 包含提示文本和数字输入框
             */
            Row.margin({ top: { "id": 16777233, "type": 10002, params: [], "bundleName": "com.example.nativetemplatedemo", "moduleName": "entry" } });
            /**
             * X值输入区域布局
             * 包含提示文本和数字输入框
             */
            Row.padding({ left: { "id": 16777248, "type": 10002, params: [], "bundleName": "com.example.nativetemplatedemo", "moduleName": "entry" }, right: { "id": 16777248, "type": 10002, params: [], "bundleName": "com.example.nativetemplatedemo", "moduleName": "entry" } });
            /**
             * X值输入区域布局
             * 包含提示文本和数字输入框
             */
            Row.width(CommonContants.FULL_PARENT);
            /**
             * X值输入区域布局
             * 包含提示文本和数字输入框
             */
            Row.justifyContent(FlexAlign.Start);
        }, Row);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Text.create({ "id": 16777220, "type": 10003, params: [], "bundleName": "com.example.nativetemplatedemo", "moduleName": "entry" });
            Text.fontColor(Color.Black);
            Text.fontSize({ "id": 16777241, "type": 10002, params: [], "bundleName": "com.example.nativetemplatedemo", "moduleName": "entry" });
            Text.height({ "id": 16777252, "type": 10002, params: [], "bundleName": "com.example.nativetemplatedemo", "moduleName": "entry" });
        }, Text);
        Text.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            TextInput.create({ controller: this.textInputControllerX });
            TextInput.type(InputType.Number);
            TextInput.height(CommonContants.FULL_PARENT);
            TextInput.margin({ left: { "id": 16777247, "type": 10002, params: [], "bundleName": "com.example.nativetemplatedemo", "moduleName": "entry" } });
            TextInput.layoutWeight(CommonContants.TEXTINPUT_LAYOUT_WEIGHT);
            TextInput.onChange(value => {
                this.numX = Number.parseFloat(value);
            });
        }, TextInput);
        /**
         * X值输入区域布局
         * 包含提示文本和数字输入框
         */
        Row.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            /**
             * Y值输入区域布局
             * 包含提示文本和数字输入框
             */
            Row.create();
            /**
             * Y值输入区域布局
             * 包含提示文本和数字输入框
             */
            Row.height({ "id": 16777251, "type": 10002, params: [], "bundleName": "com.example.nativetemplatedemo", "moduleName": "entry" });
            /**
             * Y值输入区域布局
             * 包含提示文本和数字输入框
             */
            Row.margin({ top: { "id": 16777245, "type": 10002, params: [], "bundleName": "com.example.nativetemplatedemo", "moduleName": "entry" } });
            /**
             * Y值输入区域布局
             * 包含提示文本和数字输入框
             */
            Row.padding({ left: { "id": 16777248, "type": 10002, params: [], "bundleName": "com.example.nativetemplatedemo", "moduleName": "entry" }, right: { "id": 16777248, "type": 10002, params: [], "bundleName": "com.example.nativetemplatedemo", "moduleName": "entry" } });
            /**
             * Y值输入区域布局
             * 包含提示文本和数字输入框
             */
            Row.width(CommonContants.FULL_PARENT);
            /**
             * Y值输入区域布局
             * 包含提示文本和数字输入框
             */
            Row.justifyContent(FlexAlign.Start);
        }, Row);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Text.create({ "id": 16777221, "type": 10003, params: [], "bundleName": "com.example.nativetemplatedemo", "moduleName": "entry" });
            Text.fontColor(Color.Black);
            Text.fontSize({ "id": 16777241, "type": 10002, params: [], "bundleName": "com.example.nativetemplatedemo", "moduleName": "entry" });
            Text.height({ "id": 16777252, "type": 10002, params: [], "bundleName": "com.example.nativetemplatedemo", "moduleName": "entry" });
        }, Text);
        Text.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            TextInput.create({ controller: this.textInputControllerY });
            TextInput.type(InputType.Number);
            TextInput.height(CommonContants.FULL_PARENT);
            TextInput.margin({ left: { "id": 16777247, "type": 10002, params: [], "bundleName": "com.example.nativetemplatedemo", "moduleName": "entry" } });
            TextInput.layoutWeight(CommonContants.TEXTINPUT_LAYOUT_WEIGHT);
            TextInput.onChange(value => {
                this.numY = Number.parseFloat(value);
            });
        }, TextInput);
        /**
         * Y值输入区域布局
         * 包含提示文本和数字输入框
         */
        Row.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            /**
             * Z值输入区域布局
             * 包含提示文本和数字输入框
             */
            Row.create();
            /**
             * Z值输入区域布局
             * 包含提示文本和数字输入框
             */
            Row.height({ "id": 16777251, "type": 10002, params: [], "bundleName": "com.example.nativetemplatedemo", "moduleName": "entry" });
            /**
             * Z值输入区域布局
             * 包含提示文本和数字输入框
             */
            Row.margin({ top: { "id": 16777245, "type": 10002, params: [], "bundleName": "com.example.nativetemplatedemo", "moduleName": "entry" } });
            /**
             * Z值输入区域布局
             * 包含提示文本和数字输入框
             */
            Row.padding({ left: { "id": 16777248, "type": 10002, params: [], "bundleName": "com.example.nativetemplatedemo", "moduleName": "entry" }, right: { "id": 16777248, "type": 10002, params: [], "bundleName": "com.example.nativetemplatedemo", "moduleName": "entry" } });
            /**
             * Z值输入区域布局
             * 包含提示文本和数字输入框
             */
            Row.width(CommonContants.FULL_PARENT);
            /**
             * Z值输入区域布局
             * 包含提示文本和数字输入框
             */
            Row.justifyContent(FlexAlign.Start);
        }, Row);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Text.create({ "id": 16777268, "type": 10003, params: [], "bundleName": "com.example.nativetemplatedemo", "moduleName": "entry" });
            Text.fontColor(Color.Black);
            Text.fontSize({ "id": 16777241, "type": 10002, params: [], "bundleName": "com.example.nativetemplatedemo", "moduleName": "entry" });
            Text.height({ "id": 16777252, "type": 10002, params: [], "bundleName": "com.example.nativetemplatedemo", "moduleName": "entry" });
        }, Text);
        Text.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            TextInput.create({ controller: this.textInputControllerZ });
            TextInput.type(InputType.Number);
            TextInput.height(CommonContants.FULL_PARENT);
            TextInput.margin({ left: { "id": 16777247, "type": 10002, params: [], "bundleName": "com.example.nativetemplatedemo", "moduleName": "entry" } });
            TextInput.layoutWeight(CommonContants.TEXTINPUT_LAYOUT_WEIGHT);
            TextInput.onChange(value => {
                this.numZ = Number.parseFloat(value);
            });
        }, TextInput);
        /**
         * Z值输入区域布局
         * 包含提示文本和数字输入框
         */
        Row.pop();
        /**
         * 页面整体布局结构，采用垂直排列的Column容器
         * 包含标题、消息提示、功能区域和三个数值输入框
         */
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
