import { emitter } from '@kit.BasicServicesKit';
import { preferences } from '@kit.ArkData';
import Logger from '../model/Logger';
import ThemeDesktop from '../common/ThemeDesktop';

/**
 * Defines an interface for storing image and name pairs.
 */
export interface ImageAndName {
  image: Resource;
  name: ResourceStr;
}

/**
 * Contains different sets of themes, each with an array of ImageAndName objects.
 */
const THEMES: Array<ImageAndName>[] = [
  // Default theme array
  [
    { image: $r('app.media.dialer'), name: $r('app.string.dialer') },
    // Other theme arrays omitted for brevity...
  ],
  // Simplicity theme array
  [
    { image: $r('app.media.simplicityCall'), name: $r('app.string.dialer') },
    // Other theme arrays omitted for brevity...
  ],
  // Pomelo White theme array
  [
    { image: $r('app.media.pwcall'), name: $r('app.string.dialer') },
    // Other theme arrays omitted for brevity...
  ]
]

/**
 * Tag used for logging.
 */
const TAG: string = '[Index]';

/**
 * Name of the preferences file.
 */
const PREFERENCES_NAME = 'theme.db';

/**
 * Names of the available themes.
 */
const THEME_NAMES: string[] = ['default', 'simplicity', 'pomeloWhtie'];

/**
 * Preferences object for storing theme settings.
 */
let preferenceTheme: preferences.Preferences | null = null;

/**
 * Main component class.
 */
@Entry
@Component
struct Index {
  @State nowTheme: string = '';
  @State themeDatas: Array<ImageAndName> = [];

  /**
   * Lifecycle method called before the component appears.
   */
  async aboutToAppear() {
    // Retrieve lightweight storage db files from memory.
    await this.getPreferencesFromStorage()
    // Retrieve the key value with the name 'theme' from the lightweight storage db file.
    this.nowTheme = await this.getPreference()
    console.info(`nowTheme__get ${this.nowTheme}`)
    // Emit the current theme information.
    emitter.emit({ eventId: 0, priority: 0 }, {
      data: {
        nowTheme: this.nowTheme
      }
    })
    // Update the current theme data.
    let index = THEME_NAMES.indexOf(this.nowTheme)
    this.themeDatas = THEMES[index]
  }

  /**
   * Retrieves preferences from storage.
   */
  async getPreferencesFromStorage() {
    let context = getContext(this) as Context
    preferenceTheme = await preferences.getPreferences(context, PREFERENCES_NAME)
  }

  /**
   * Stores a theme preference.
   * @param data The theme name to store.
   */
  async putPreference(data: string) {
    Logger.info(TAG, `Put begin`)
    if (preferenceTheme !== null) {
      await preferenceTheme.put('theme', data)
      await preferenceTheme.flush()
    }
  }

  /**
   * Retrieves the current theme preference.
   * @returns The current theme name.
   */
  async getPreference(): Promise<string> {
    Logger.info(TAG, `Get begin`)
    let theme: string = ''
    if (preferenceTheme !== null) {
      theme = await preferenceTheme.get('theme', 'default') as string;
      return theme;
    }
    return theme;
  }

  /**
   * Changes the current theme.
   * @param themeNum The index of the theme to change to.
   */
  changeTheme(themeNum: number) {
    this.themeDatas = THEMES[themeNum];
    this.putPreference(THEME_NAMES[themeNum]);
  }

  /**
   * Builds the component UI.
   */
  build() {
    Column() {
      Row() {
        Text($r('app.string.MainAbility_label'))
          .fontSize(25)
          .layoutWeight(5)
          .padding({ left: 10 })
          .fontColor(Color.White)
          .fontWeight(FontWeight.Bold)
        Image($r('app.media.change'))
          .key('changeBtn')
          .id('changeBtn')
          .height(30)
          .layoutWeight(1)
          .objectFit(ImageFit.ScaleDown)
          .bindMenu([
            {
              value: THEME_NAMES[0],
              action: () => {
                this.changeTheme(0)
              }
            },
            {
              value: THEME_NAMES[1],
              action: () => {
                this.changeTheme(1)
              }
            },
            {
              value: THEME_NAMES[2],
              action: () => {
                this.changeTheme(2)
              }
            }
          ])
      }
      .width('100%')
      .height(50)
      .backgroundColor('#0D9FFB')

      ThemeDesktop({ themeDatas: $themeDatas })
    }
    .width('100%')
    .height('100%')
  }
}
