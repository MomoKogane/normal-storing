/**
 * Native模板页面组件，用于接收用户输入的三个数值，
 * 调用原生模块进行排序并展示结果。
 */
import libHello from 'libhello.so';
import CommonContants from '../../common/CommonContants';

@Entry
@Component
struct NativeTemplate {
  /**
   * 存储排序结果字符串，初始值为'0'
   * 用于绑定显示在结果文本区域
   */
  @State result: string = '0';

  /**
   * 存储用户输入的X数值，初始值为0.0
   * 与输入框X双向绑定
   */
  @State numX: number = 0.0;

  /**
   * 存储用户输入的Y数值，初始值为0.0
   * 与输入框Y双向绑定
   */
  @State numY: number = 0.0;

  /**
   * 存储用户输入的Z数值，初始值为0.0
   * 与输入框Z双向绑定
   */
  @State numZ: number = 0.0;

  /**
   * 输入框X的控制器，用于管理文本输入状态
   */
  private textInputControllerX: TextInputController = new TextInputController();

  /**
   * 输入框Y的控制器，用于管理文本输入状态
   */
  private textInputControllerY: TextInputController = new TextInputController();

  /**
   * 输入框Z的控制器，用于管理文本输入状态
   */
  private textInputControllerZ: TextInputController = new TextInputController();

  build() {
    /**
     * 页面整体布局结构，采用垂直排列的Column容器
     * 包含标题、消息提示、功能区域和三个数值输入框
     */
    Column() {
      // 标题区域布局配置
      Row() {
        Text($r('app.string.title'))
          .fontSize($r('app.float.tittle_font_size'))
          .fontWeight(CommonContants.FONT_WEIGHT)
          .height($r('app.float.title_text_height'))
          .align(Alignment.Center)
          .maxLines(CommonContants.MAX_LINES)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
      }
      .height($r('app.float.title_height'))
      .width(CommonContants.FULL_PARENT)
      .padding({
        left: $r('app.float.text_padding_left'),
        right: $r('app.float.text_padding_left'),
        top: $r('app.float.text_padding_top')
      })

      // 消息提示区域布局配置
      Row() {
        Text($r('app.string.message'))
          .fontSize($r('app.float.message_font_size'))
          .fontWeight(CommonContants.FONT_WEIGHT)
          .height($r('app.float.message_text_height'))
          .align(Alignment.Center)
          .maxLines(CommonContants.MAX_LINES)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
      }
      .height($r('app.float.message_height'))
      .width(CommonContants.FULL_PARENT)
      .padding({ left: $r('app.float.text_padding_left'), right: $r('app.float.text_padding_left') })
      .justifyContent(FlexAlign.Start)
      .alignItems(VerticalAlign.Bottom)

      /**
       * 结果展示与操作区域布局
       * 包含结果提示标签、排序按钮和结果显示文本
       */
      Column() {
        Row() {
          Text($r('app.string.result_tip'))
            .height($r('app.float.tips_result_message_height'))
            .fontColor($r('app.color.tips_result_color'))
            .fontSize($r('app.float.tips_result_font_size'))
        }
        .height($r('app.float.tips_result_height'))
        .justifyContent(FlexAlign.End)
        .alignItems(VerticalAlign.Bottom)
        .width(CommonContants.FULL_PARENT)
        .padding({
          bottom: $r('app.float.tips_result_padding_bottom'),
          right: $r('app.float.tips_result_padding_right')
        })

        /**
         * 按钮与结果文本布局
         * 实现按钮左对齐、结果文本右对齐的响应式布局
         */
        Row() {
          /**
           * 排序按钮点击事件处理
           * 调用原生模块libhello.so的mySort函数进行排序
           * 处理返回的数组字符串并更新结果展示
           */
          Button($r('app.string.submit_button'))
            .fontSize($r('app.float.submit_button_font_size'))
            .fontWeight(CommonContants.FONT_WEIGHT)
            .height(CommonContants.FULL_PARENT)
            .width($r('app.float.button_width'))
            .onClick(() => {
              const raw = libHello.mySort(this.numX, this.numY, this.numZ);
              const parts = raw.replace(/^\[|\]$/g, '').split(',');
              this.result = parts.map(n => Math.floor(Number(n))).join(', ');
            });

          // 结果文本展示配置
          Text(this.result)
            .textAlign(TextAlign.End)
            .fontColor(Color.Black)
            .fontSize($r('app.float.result_font_size'))
            .layoutWeight(1)
            .height(CommonContants.FULL_PARENT)
            .textOverflow({ overflow: TextOverflow.Clip })
            .padding({ right: $r('app.float.result_padding_right') });
        }
        .height($r('app.float.result_height'))
        .width(CommonContants.FULL_PARENT)
        .justifyContent(FlexAlign.SpaceBetween)
        .alignItems(VerticalAlign.Bottom)
        .margin({ top: $r('app.float.button_margin_top') });
      }
      .margin($r('app.float.function_area_margin'))
      .borderRadius($r('app.float.function_area_border_radius'))
      .height($r('app.float.function_area_height'))
      .backgroundColor(Color.White)

      /**
       * X值输入区域布局
       * 包含提示文本和数字输入框
       */
      Row() {
        Text($r('app.string.input_x_value'))
          .fontColor(Color.Black)
          .fontSize($r('app.float.num_tips_font_size'))
          .height($r('app.float.tips_num_text_height'))
        TextInput({ controller: this.textInputControllerX })
          .type(InputType.Number)
          .height(CommonContants.FULL_PARENT)
          .margin({ left: $r('app.float.text_input_margin_left') })
          .layoutWeight(CommonContants.TEXTINPUT_LAYOUT_WEIGHT)
          /**
           * 输入值变化监听器
           * 将输入字符串转换为浮点数存储到numX状态变量
           */
          .onChange(value => {
            this.numX = Number.parseFloat(value);
          })
      }
      .height($r('app.float.tips_num_height'))
      .margin({ top: $r('app.float.first_tips_num_margin_top') })
      .padding({ left: $r('app.float.text_input_padding'), right: $r('app.float.text_input_padding') })
      .width(CommonContants.FULL_PARENT)
      .justifyContent(FlexAlign.Start)

      /**
       * Y值输入区域布局
       * 包含提示文本和数字输入框
       */
      Row() {
        Text($r('app.string.input_y_value'))
          .fontColor(Color.Black)
          .fontSize($r('app.float.num_tips_font_size'))
          .height($r('app.float.tips_num_text_height'))
        TextInput({ controller: this.textInputControllerY })
          .type(InputType.Number)
          .height(CommonContants.FULL_PARENT)
          .margin({ left: $r('app.float.text_input_margin_left') })
          .layoutWeight(CommonContants.TEXTINPUT_LAYOUT_WEIGHT)
          /**
           * 输入值变化监听器
           * 将输入字符串转换为浮点数存储到numY状态变量
           */
          .onChange(value => {
            this.numY = Number.parseFloat(value);
          })
      }
      .height($r('app.float.tips_num_height'))
      .margin({ top: $r('app.float.second_tips_num_margin_top') })
      .padding({ left: $r('app.float.text_input_padding'), right: $r('app.float.text_input_padding') })
      .width(CommonContants.FULL_PARENT)
      .justifyContent(FlexAlign.Start)

      /**
       * Z值输入区域布局
       * 包含提示文本和数字输入框
       */
      Row() {
        Text($r('app.string.input_z_value'))
          .fontColor(Color.Black)
          .fontSize($r('app.float.num_tips_font_size'))
          .height($r('app.float.tips_num_text_height'))
        TextInput({ controller: this.textInputControllerZ })
          .type(InputType.Number)
          .height(CommonContants.FULL_PARENT)
          .margin({ left: $r('app.float.text_input_margin_left') })
          .layoutWeight(CommonContants.TEXTINPUT_LAYOUT_WEIGHT)
          /**
           * 输入值变化监听器
           * 将输入字符串转换为浮点数存储到numZ状态变量
           */
          .onChange(value => {
            this.numZ = Number.parseFloat(value);
          })
      }
      .height($r('app.float.tips_num_height'))
      .margin({ top: $r('app.float.second_tips_num_margin_top') })
      .padding({ left: $r('app.float.text_input_padding'), right: $r('app.float.text_input_padding') })
      .width(CommonContants.FULL_PARENT)
      .justifyContent(FlexAlign.Start)
    }
    .width(CommonContants.FULL_PARENT)
    .height(CommonContants.FULL_PARENT)
    .backgroundColor($r('app.color.background_color'))
  }
}