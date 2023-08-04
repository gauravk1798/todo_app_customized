import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_list/i10n/messages_all.dart';

class IntlLocalizations {
  static Future<IntlLocalizations> load(Locale locale) {
    final String? name =
        locale.countryCode!=null && locale.countryCode!.isEmpty ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);
    print("name是：$localeName");
    return initializeMessages(localeName).then((b) {
      Intl.defaultLocale = localeName;
      return new IntlLocalizations();
    });
  }

  static IntlLocalizations? of(BuildContext context) {
    return Localizations.of<IntlLocalizations>(context, IntlLocalizations);
  }

  String get appName {
    return Intl.message("One Day List", name: "appName", desc: "Demo web app");
  }

  String get tryToSearch => Intl.message(
        'Try searching for the title or content',
        name: 'tryToSearch',
        desc: 'Try searching for the title or content',
      );
  String get searchIcon => Intl.message(
        'Try searching for icon name',
        name: 'searchIcon',
        desc: 'Try searching for icon name',
      );

  String get myAccount => Intl.message(
        'My Account',
        name: 'myAccount',
        desc: 'My Accoun',
      );
  String get doneList => Intl.message(
        'Done List',
        name: 'doneList',
        desc: 'Done List',
      );
  String get toFinishTask => Intl.message(
        'Try to complete a task!',
        name: 'toFinishTask',
        desc: 'Try to complete a task!',
      );
  String get taskNum => Intl.message(
        'Task Number',
        name: 'taskNum',
        desc: 'Task Number',
      );
  String get createDate => Intl.message(
        'Create Date',
        name: 'createDate',
        desc: 'Create Date',
      );
  String get completeDate => Intl.message(
        'Complete Date',
        name: 'completeDate',
        desc: 'Complete Date',
      );
  String get spendTime => Intl.message(
        'Spend Time',
        name: 'spendTime',
        desc: 'Spend Time',
      );
  String get changedTimes => Intl.message(
        'Changed Times',
        name: 'changedTimes',
        desc: 'Changed Times',
      );
  String hours(int hours) {
    return Intl.plural(hours,
        zero: "Too Fast",
        one: "1 hour",
        many: "$hours hours",
        other: "$hours hours",
        args: [hours],
        name: "hours");
  }

  String days(int days) {
    return Intl.plural(days,
        zero: "Too Fast",
        one: "1 day",
        many: "$days days",
        other: "$days days",
        args: [days],
        name: "days");
  }

  String get languageTitle {
    return Intl.message(
      'Change Language',
      name: 'languageTitle',
      desc: 'Change Language',
    );
  }

  String get changeTheme {
    return Intl.message(
      'Change Theme',
      name: 'changeTheme',
      desc: 'Change Theme',
    );
  }

  String get feedback => Intl.message(
        'Feedback',
        name: 'feedback',
        desc: 'Feedback',
      );
  String get feedbackWall => Intl.message(
        'Feedback Wall',
        name: 'feedbackWall',
        desc: 'Feedback Wall',
      );
  String get feedbackCantBeNull => Intl.message(
        'feedback cannot be empty',
        name: 'feedbackCantBeNull',
        desc: 'feedback cannot be empty',
      );
  String get feedbackIsTooLittle => Intl.message(
        'feedback is too little, add a little more',
        name: 'feedbackIsTooLittle',
        desc: 'feedback is too little, add a little more',
      );
  String get feedbackNeedEmoji => Intl.message(
        'please choose an emoji ',
        name: 'feedbackNeedEmoji',
        desc: 'please choose an emoji',
      );
  String get feedbackFrequently => Intl.message(
        'Can only be submitted once in 8 hours. ',
        name: 'feedbackFrequently',
        desc: 'Can only be submitted once in 8 hours.',
      );
  String get writeYourFeedback => Intl.message(
        'write your feedback ',
        name: 'writeYourFeedback',
        desc: 'write your feedbac',
      );
  String get writeYourContactInfo => Intl.message(
        'whether to leave your contact information',
        name: 'writeYourContactInfo',
        desc: 'whether to leave your contact information',
      );
  String get waitAMoment => Intl.message(
        'please wait for a moment...',
        name: 'waitAMoment',
        desc: 'please wait for a moment...',
      );
  String get submitSuccess => Intl.message(
        'submit success!',
        name: 'submitSuccess',
        desc: 'submit success!',
      );
  String get thanksForFeedback => Intl.message(
        'Thanks for your feedback',
        name: 'thanksForFeedback',
        desc: 'Thanks for your feedback',
      );
  String get submitAgain => Intl.message(
        'submit again',
        name: 'submitAgain',
        desc: 'submit again',
      );
  String get noName => Intl.message(
        'anonymous',
        name: 'noName',
        desc: 'anonymous',
      );

  String get appSetting {
    return Intl.message(
      'Setting',
      name: 'appSetting',
      desc: 'Setting',
    );
  }

  String get backgroundGradient {
    return Intl.message(
      'Background Gradient',
      name: 'backgroundGradient',
      desc: 'Background Gradien',
    );
  }

  String get splashAnimation => Intl.message(
        'Turn on splash animation',
        name: 'splashAnimation',
        desc: 'Turn on splash animation',
      );
  String get bgChangeWithCard => Intl.message(
        'Background follow task icon color',
        name: 'bgChangeWithCard',
        desc: '背景跟随任务图标颜色',
      );
  String get cardChangeWithBg => Intl.message(
        'Task icon color follow background',
        name: 'cardChangeWithBg',
        desc: '任务图标颜色跟随背景',
      );
  String get enableInfiniteScroll => Intl.message(
        'Task card cycle slide',
        name: 'enableInfiniteScroll',
        desc: '任务卡片循环滑动',
      );
  String get enableWeatherShow => Intl.message(
        'Turn on the weather',
        name: 'enableWeatherShow',
        desc: '开启天气',
      );
  String get enableNetPicBgInMainPage => Intl.message(
        'Turn on the net-picture background',
        name: 'enableNetPicBgInMainPage',
        desc: '开启主页网络图片背景',
      );
  String get inputCurrentCity => Intl.message(
        'input your city',
        name: 'inputCurrentCity',
        desc: 'input your city',
      );
  String get weatherGetWrong => Intl.message(
        'failed to get the weather，please try again',
        name: 'weatherGetWrong',
        desc: '天气获取失败,请重新尝试',
      );
  String get weatherGetting => Intl.message(
        'the weather is inquiring...',
        name: 'weatherGetting',
        desc: '天气获取中...',
      );
  String get weatherSuccess => Intl.message(
        'the weather is successful',
        name: 'weatherSuccess',
        desc: '天气获取成功',
      );

  String get blog => Intl.message(
        'Blog',
        name: 'blog',
        desc: 'Blog',
      );
  String get myBlog => Intl.message(
        'Flutter Web Blog',
        name: 'myBlog',
        desc: 'flutter web Blog',
      );

  String get aboutApp {
    return Intl.message(
      'About',
      name: 'aboutApp',
      desc: 'About',
    );
  }

  String get versionDescription => Intl.message(
        'Version Description',
        name: 'versionDescription',
        desc: '版本描述',
      );
  String get projectLink => Intl.message(
        'Project Link',
        name: 'projectLink',
        desc: '项目地址',
      );
  String get myGithub => Intl.message(
        'Author\'s Github',
        name: 'myGithub',
        desc: '作者的github',
      );

  String get iconSetting => Intl.message(
        'Icon Setting',
        name: 'iconSetting',
        desc: 'Icon Setting',
      );
  String get navigatorSetting => Intl.message(
        'Navigator Setting',
        name: 'navigatorSetting',
        desc: '导航栏设置',
      );
  String get meteorShower => Intl.message(
        'Meteor Shower',
        name: 'meteorShower',
        desc: '天体流星',
      );
  String get dailyPic => Intl.message(
        'Daily wallpaper',
        name: 'dailyPic',
        desc: '每日壁纸',
      );
  String get netPicture => Intl.message(
        'Network Picture',
        name: 'netPicture',
        desc: '网络图片',
      );
  String get accountBackgroundSetting => Intl.message(
        'Background setting',
        name: 'accountBackgroundSetting',
        desc: '背景设置',
      );
  String get picture => Intl.message(
        'Picture',
        name: 'picture',
        desc: 'Picture',
      );
  String get cartOpacity => Intl.message(
        'Card background opacity',
        name: 'cartOpacity',
        desc: '卡片背景透明度',
      );
  String get enableTaskDetailOpacity => Intl.message(
        'Enable task page background to be transparent',
        name: 'enableTaskDetailOpacity',
        desc: '开启任务界面背景透明',
      );

  String get currentIcons => Intl.message(
        'Current Icons',
        name: 'currentIcons',
        desc: '当前图标',
      );
  String get game => Intl.message(
        'Game',
        name: 'game',
        desc: '打游戏',
      );
  String get music => Intl.message(
        'Music',
        name: 'music',
        desc: '听歌',
      );
  String get read => Intl.message(
        'Read',
        name: 'read',
        desc: '读书',
      );
  String get sports => Intl.message(
        'Sports',
        name: 'sports',
        desc: '运动',
      );
  String get travel => Intl.message(
        'Travel',
        name: 'travel',
        desc: '旅行',
      );
  String get work => Intl.message(
        'Work',
        name: 'work',
        desc: '工作',
      );

  String get setIconName => Intl.message(
        'icon name',
        name: 'setIconName',
        desc: '给图标设置一个名字吧',
      );
  String get defaultIconName => Intl.message(
        'default',
        name: 'defaultIconName',
        desc: '默认',
      );
  String get customIcon => Intl.message(
        'Custom Icon',
        name: 'customIcon',
        desc: '自定义图标',
      );
  String get cancel => Intl.message(
        'cancel',
        name: 'cancel',
        desc: 'cancel',
      );
  String get ok => Intl.message(
        'ok',
        name: 'ok',
        desc: 'ok',
      );
  String get pickAColor => Intl.message(
        'Pick a color!',
        name: 'pickAColor',
        desc: '选择一个颜色吧!',
      );
  String get canNotAddMoreIcon => Intl.message(
        'You can only customize up to 10 icons.',
        name: 'canNotAddMoreIcon',
        desc: '最多只能自定义10个图标',
      );
  String get canNotEditDefaultIcon => Intl.message(
        'Can\'t edit the default icon',
        name: 'canNotEditDefaultIcon',
        desc: '默认图标无法编辑哦',
      );
  String get customTheme => Intl.message(
        'Custom Theme',
        name: 'customTheme',
        desc: '自定义主题',
      );
  String get canNotAddMoreTheme => Intl.message(
        'You can only customize up to 10 themes.',
        name: 'canNotAddMoreTheme',
        desc: '最多只能自定义10个主题哦',
      );
  String get writeAtLeastOneTaskItem => Intl.message(
        'Please write at least one task.',
        name: 'writeAtLeastOneTaskItem',
        desc: '请至少写下一项任务哦',
      );
  String get defaultTitle => Intl.message(
        'Default title',
        name: 'defaultTitle',
        desc: '默认标题',
      );

  String get avatarLocal => Intl.message(
        'Select an avatar from the local',
        name: 'avatarLocal',
        desc: '从本地选取头像',
      );
  String get avatarNet => Intl.message(
        'Select an avatar from the network',
        name: 'avatarNet',
        desc: '从网络选取头像',
      );
  String get avatarHistory => Intl.message(
        'Select an avatar from the history',
        name: 'avatarHistory',
        desc: '历史头像记录',
      );
  String get avatar => Intl.message(
        'avatar',
        name: 'avatar',
        desc: 'avatar',
      );
  String get save => Intl.message(
        'save',
        name: 'save',
        desc: 'save',
      );
  String get history => Intl.message(
        'history',
        name: 'history',
        desc: 'history',
      );
  String get netPicHistory => Intl.message(
        'Net picture history',
        name: 'netPicHistory',
        desc: '历史图片',
      );
  String get selectLocalImage => Intl.message(
        'Select local image',
        name: 'selectLocalImage',
        desc: '本地图片',
      );

  String get deniedDes => Intl.message(
        'Permission denied',
        name: 'deniedDes',
        desc: '权限被拒绝',
      );
  String get disabledDes => Intl.message(
        'Permission not available',
        name: 'disabledDes',
        desc: '权限不可用',
      );
  String get restrictedDes => Intl.message(
        'Permission is restricted',
        name: 'restrictedDes',
        desc: '权限被限制',
      );
  String get unknownDes => Intl.message(
        'Unknown permission',
        name: 'unknownDes',
        desc: '未知权限',
      );
  String get openSystemSetting => Intl.message(
        'Open System Setting',
        name: 'openSystemSetting',
        desc: '打开系统设置',
      );

  String get checkUpdate {
    return Intl.message(
      'Check Update',
      name: 'checkUpdate',
      desc: '检查更新',
    );
  }

  String get update => Intl.message(
        'update',
        name: 'update',
        desc: '升级',
      );
  String get newVersionIsComing => Intl.message(
        'New version is comming!',
        name: 'newVersionIsComing',
        desc: '新版本来啦!',
      );
  String get noUpdate => Intl.message(
        'It is the latest version',
        name: 'noUpdate',
        desc: '已是最新版本',
      );

  String get welcomeWord {
    return Intl.message(
      'Hello! ',
      name: 'welcomeWord',
      desc: 'Hello!',
    );
  }

  String get customUserName => Intl.message(
        'Setting your username',
        name: 'customUserName',
        desc: 'Setting your username',
      );
  String get inputUserName => Intl.message(
        'input your username',
        name: 'inputUserName',
        desc: '输入你的昵称吧',
      );
  String get userNameCantBeNull => Intl.message(
        'username can not be empty',
        name: 'userNameCantBeNull',
        desc: '昵称不能为空哦!',
      );

  String get random {
    return Intl.message(
      'random',
      name: 'random',
      desc: 'random',
    );
  }

  String get pink {
    return Intl.message(
      'pink',
      name: 'pink',
      desc: 'pink',
    );
  }

  String get coffee {
    return Intl.message(
      'coffee',
      name: 'coffee',
      desc: 'coffee',
    );
  }

  String get cyan {
    return Intl.message(
      'cyan',
      name: 'cyan',
      desc: '主题颜色',
    );
  }

  String get green {
    return Intl.message(
      'green',
      name: 'green',
      desc: '主题颜色',
    );
  }

  String get purple {
    return Intl.message(
      'purple',
      name: 'purple',
      desc: '主题颜色',
    );
  }

  String get dark {
    return Intl.message(
      'dark',
      name: 'dark',
      desc: '主题颜色',
    );
  }

  String get blueGray {
    return Intl.message(
      'blue-gray',
      name: 'blueGray',
      desc: '主题颜色',
    );
  }

  String get login => Intl.message(
        'Login',
        name: 'login',
        desc: 'Login',
      );
  String get email => Intl.message(
        'EMAIL',
        name: 'email',
        desc: 'EMAIL',
      );
  String get password => Intl.message(
        'PASSWORD',
        name: 'password',
        desc: 'PASSWORD',
      );
  String get inputEmail => Intl.message(
        'Enter email',
        name: 'inputEmail',
        desc: 'Enter email',
      );
  String get inputPassword => Intl.message(
        'Enter password',
        name: 'inputPassword',
        desc: 'Enter password',
      );
  String get forget => Intl.message(
        'Forget',
        name: 'forget',
        desc: 'Forget',
      );
  String get logIn => Intl.message(
        'Log In',
        name: 'logIn',
        desc: 'Log In',
      );
  String get haveNoAccount => Intl.message(
        'Don\'t have an Account?Sign Up',
        name: 'haveNoAccount',
        desc: 'Don\'t have an Account?Sign Up',
      );
  String get register => Intl.message(
        'Register',
        name: 'register',
        desc: 'Register',
      );
  String get emailCantBeEmpty => Intl.message(
        'email cannot be empty',
        name: 'emailCantBeEmpty',
        desc: 'email cannot be empty',
      );
  String get emailIncorrectFormat => Intl.message(
        'email format is incorrect',
        name: 'emailIncorrectFormat',
        desc: 'email format is incorrect',
      );
  String get passwordCantBeEmpty => Intl.message(
        'password cannot be empty',
        name: 'passwordCantBeEmpty',
        desc: 'password cannot be empty',
      );
  String get passwordTooShort => Intl.message(
        'password length cannot be less than 8 digits',
        name: 'passwordTooShort',
        desc: 'password length cannot be less than 8 digits',
      );
  String get passwordTooLong => Intl.message(
        'password length cannot be greater than 20 digits',
        name: 'passwordTooLong',
        desc: 'password length cannot be greater than 20 digits',
      );
  String get signUp => Intl.message(
        'Sign Up',
        name: 'signUp',
        desc: 'Sign Up',
      );
  String get setUserName => Intl.message(
        'please set your username',
        name: 'setUserName',
        desc: 'please set your username',
      );
  String get userNameContainEmpty => Intl.message(
        'username cannot contain spaces',
        name: 'userNameContainEmpty',
        desc: 'username cannot contain spaces',
      );
  String get verifyCodeCantBeEmpty => Intl.message(
        'verify code cannot be empty',
        name: 'verifyCodeCantBeEmpty',
        desc: 'verify code cannot be empty',
      );
  String get verifyCodeContainEmpty => Intl.message(
        'verify code cannot contain spaces',
        name: 'verifyCodeContainEmpty',
        desc: 'verify code cannot contain spaces',
      );
  String get confirmPasswordCantBeEmpty => Intl.message(
        'confirm password cannot be empty',
        name: 'confirmPasswordCantBeEmpty',
        desc: 'confirm password cannot be empty',
      );
  String get confirmPasswordContainEmpty => Intl.message(
        'confirm password cannot contain spaces',
        name: 'confirmPasswordContainEmpty',
        desc: 'confirm password cannot contain spaces',
      );
  String get twoPasswordsNotSame => Intl.message(
        'two passwords are not same',
        name: 'twoPasswordsNotSame',
        desc: 'two passwords are not same',
      );
  String get userName => Intl.message(
        'username',
        name: 'userName',
        desc: 'username',
      );
  String get emailAccount => Intl.message(
        'email account',
        name: 'emailAccount',
        desc: 'email account',
      );
  String get setEmailAccount => Intl.message(
        'please set your email account',
        name: 'setEmailAccount',
        desc: 'please set your email account',
      );
  String get inputEmailAccount => Intl.message(
        'please input your email account',
        name: 'inputEmailAccount',
        desc: 'please input your email account',
      );
  String get verifyCode => Intl.message(
        'verify code',
        name: 'verifyCode',
        desc: 'verify code',
      );
  String get inputVerifyCode => Intl.message(
        'please input the verify code you obtained',
        name: 'inputVerifyCode',
        desc: 'please input the verify code you obtained',
      );
  String get getVerifyCode => Intl.message(
        'Get Verify Code',
        name: 'getVerifyCode',
        desc: 'Get Verify Code',
      );
  String get setPassword => Intl.message(
        'please set your password',
        name: 'setPassword',
        desc: 'please set your password',
      );
  String get thePassword => Intl.message(
        'password',
        name: 'thePassword',
        desc: 'password',
      );
  String get reSetPassword => Intl.message(
        'please set your password again',
        name: 'reSetPassword',
        desc: 'please set your password again',
      );
  String get confirmPassword => Intl.message(
        'confirm password',
        name: 'confirmPassword',
        desc: 'confirm password',
      );
  String get checkYourEmail => Intl.message(
        'please check your email account',
        name: 'checkYourEmail',
        desc: 'please check your email account',
      );
  String get checkYourEmailOrPassword => Intl.message(
        'please check your email account or password',
        name: 'checkYourEmailOrPassword',
        desc: 'please check your email account or password',
      );
  String get checkYourUserName => Intl.message(
        'please check your username',
        name: 'checkYourUserName',
        desc: 'please check your username',
      );
  String get usernameCantBeEmpty => Intl.message(
        'username cannot be empty',
        name: 'usernameCantBeEmpty',
        desc: 'username cannot be empty',
      );
  String get wrongParams => Intl.message(
        'please check your input content',
        name: 'wrongParams',
        desc: 'please check your input content',
      );
  String get setNewPassword => Intl.message(
        'please set your new password',
        name: 'setNewPassword',
        desc: 'please set your new password',
      );
  String get forgetPassword => Intl.message(
        'Forget Password',
        name: 'forgetPassword',
        desc: 'Forget Password',
      );
  String get resetPassword => Intl.message(
        'Reset Password',
        name: 'resetPassword',
        desc: 'Reset Password',
      );
  String get newPassword => Intl.message(
        'new password',
        name: 'newPassword',
        desc: 'new password',
      );
  String get oldPassword => Intl.message(
        'old password',
        name: 'oldPassword',
        desc: 'old password',
      );
  String get inputOldPassword => Intl.message(
        'please input your old password',
        name: 'inputOldPassword',
        desc: 'please input your old password',
      );
  String get oldPasswordCantBeEmpty => Intl.message(
        'old password cannot be empty',
        name: 'oldPasswordCantBeEmpty',
        desc: 'old password cannot be empty',
      );
  String get newPasswordCantBeEmpty => Intl.message(
        'new password cannot be empty',
        name: 'newPasswordCantBeEmpty',
        desc: 'new password cannot be empty',
      );
  String get resetPasswordSuccess => Intl.message(
        'Password reset complete',
        name: 'resetPasswordSuccess',
        desc: 'Password reset complete',
      );
  String get resetPasswordFailed => Intl.message(
        'Password reset failed',
        name: 'resetPasswordFailed',
        desc: 'Password reset failed',
      );
  String get logout => Intl.message(
        'Logout',
        name: 'logout',
        desc: 'Logout',
      );
  String get skip => Intl.message(
        'skip',
        name: 'skip',
        desc: 'skip',
      );
  String get delete => Intl.message(
        'delete',
        name: 'delete',
        desc: 'delete',
      );
  String get doDelete => Intl.message(
        'doDelete',
        name: 'doDelete',
        desc: 'doDelete:',
      );
  String get background => Intl.message(
        'background',
        name: 'background',
        desc: 'background:',
      );
  String get setBackground => Intl.message(
        'Set Background',
        name: 'setBackground',
        desc: 'Set Background:',
      );
  String get clearBackground => Intl.message(
        'Clear Background',
        name: 'clearBackground',
        desc: 'Clear Background:',
      );
  String get textColor => Intl.message(
        'Text Color',
        name: 'textColor',
        desc: '文字颜色:',
      );
  String get fontSize => Intl.message(
        'Font Size',
        name: 'fontSize',
        desc: '字体大小:',
      );
  String get autoDarkMode => Intl.message(
        'auto dark mode',
        name: 'autoDarkMode',
        desc: '自动夜间模式',
      );
  String get selectLightTime => Intl.message(
        'select day time interval',
        name: 'selectLightTime',
        desc: '选择白天时间区间',
      );
  String get start => Intl.message(
        'start',
        name: 'start',
        desc: 'start',
      );
  String get end => Intl.message(
        'end',
        name: 'end',
        desc: 'end',
      );
  String get timeError => Intl.message(
        'start time cannot be less than end time',
        name: 'timeError',
        desc: '开始时间不能小于结束时间',
      );

  String get editTask {
    return Intl.message(
      'Edit Task',
      name: 'editTask',
      desc: '编辑任务',
    );
  }

  String get deleteTask {
    return Intl.message(
      'Delete Task',
      name: 'deleteTask',
      desc: '删除任务',
    );
  }

  String get submit => Intl.message(
        'Submit',
        name: 'submit',
        desc: 'Submit',
      );
  String get addTask => Intl.message(
        'add a task',
        name: 'addTask',
        desc: '添加任务',
      );
  String get deadline => Intl.message(
        'deadline',
        name: 'deadline',
        desc: '截止日期',
      );
  String get startDate => Intl.message(
        'start date',
        name: 'startDate',
        desc: '开始日期',
      );
  String get remindMe => Intl.message(
        'remind me',
        name: 'remindMe',
        desc: 'remind me',
      );
  String get repeat => Intl.message(
        'repeat',
        name: 'repeat',
        desc: 'repeat',
      );
  String get startAfterEnd => Intl.message(
        'The start date need be smaller than the end date.',
        name: 'startAfterEnd',
        desc: '开始日期要比结束日期小才行哦',
      );
  String get endBeforeStart => Intl.message(
        'The end date need be bigger than the start date.',
        name: 'endBeforeStart',
        desc: '结束日期要比开始日期大才行哦',
      );
  String get notSynced => Intl.message(
        'Not synced ',
        name: 'notSynced',
        desc: '未同步 ',
      );
  String get clickToSyn => Intl.message(
        'Click to sync',
        name: 'clickToSyn',
        desc: '点击同步',
      );
  String get synchronizing => Intl.message(
        'Synchronizing...',
        name: 'synchronizing',
        desc: '同步中...',
      );
  String get cloudSynchronizing => Intl.message(
        'Synchronizing from server...',
        name: 'cloudSynchronizing',
        desc: '获取云端数据...',
      );
  String get synchronizeFailed => Intl.message(
        'Synchronize failed',
        name: 'synchronizeFailed',
        desc: '同步失败',
      );

  String taskItems(int taskNumbers) {
    return Intl.plural(taskNumbers,
        zero:
            "You have never written a list of tasks.\nLet's get started soon.",
        one: "This is your todo-list,\nToday, you have 1 task to complete. ",
        many:
            "This is your todo-list,\nToday, you have $taskNumbers tasks to complete. ",
        other:
            "This is your todo-list,\nToday, you have $taskNumbers tasks to complete. ",
        args: [taskNumbers],
        name: "taskItems");
  }

  String itemNumber(int number) {
    return Intl.plural(number,
        zero: "There is No items ",
        one: "1 item ",
        other: "$number items ",
        args: [number],
        name: "itemNumber");
  }

  String get loadingEmpty => Intl.message(
        'nothing at all',
        name: 'loadingEmpty',
        desc: '什么都没有哦',
      );
  String get loadingIdle => Intl.message(
        '...',
        name: 'loadingIdle',
        desc: '......',
      );
  String get loadingError => Intl.message(
        'loading error',
        name: 'loadingError',
        desc: 'loading error',
      );
  String get loading => Intl.message(
        'loading...',
        name: 'loading',
        desc: 'loading...',
      );
  String get waiting => Intl.message(
        'waiting...',
        name: 'waiting',
        desc: 'waiting...',
      );
  String get timeOut => Intl.message(
        'timeout error',
        name: 'timeOut',
        desc: 'timeout erro',
      );
  String get pullUpToLoadMore => Intl.message(
        'pull up load more',
        name: 'pullUpToLoadMore',
        desc: 'pull up load more',
      );
  String get pullDownToRefresh => Intl.message(
        'pull down to refresh',
        name: 'pullDownToRefresh',
        desc: '下拉刷新',
      );
  String get reLoading => Intl.message(
        'click to reload',
        name: 'reLoading',
        desc: '点击重新加载',
      );
  String get requestError => Intl.message(
        'request error',
        name: 'requestError',
        desc: 'click to reload',
      );
  String get requestFailed => Intl.message(
        'request failed',
        name: 'requestFailed',
        desc: 'request failed',
      );

  ///以下是版本更新相关

  String get version100 => Intl.message(
        'Version:1.0.0 \n\n'
        'The Version 1.0.0 released!\n',
        name: 'version100',
        desc: '版本:1.0.0 \n\n'
            '版本 1.0.0 发布啦!',
      );

  String get version101 => Intl.message(
        'Version:1.0.1 \n\n'
        '1.Fixed: done list show error \n'
        '2.Add: Edit page can add start-date and deadline\n',
        name: 'version101',
        desc: '版本:1.0.1 \n\n'
            '1.修复完成列表界面的显示bug\n'
            '2.新增编辑任务可以添加起止时间，用作提醒\n',
      );

  String get version102 => Intl.message(
        'Version:1.0.2 \n\n'
        '1.Fixed: some bugs \n'
        '2.Add: IconSetting Page can search icons now \n',
        name: 'version102',
        desc: '版本:1.0.2 \n\n'
            '1.修复一些小bug \n'
            '2.图标设置界面可以搜索图标了 \n',
      );

  String get version103 => Intl.message(
        'Version:1.0.3 \n\n'
        '1.Fixed: The text color of the upgrade frame is wrong.(dark mode) \n'
        '2.Fixed: Done List complete time is negative. \n'
        '3.Add: Suggestion display wall. \n',
        name: 'version103',
        desc: '版本:1.0.3 \n\n'
            '1.修复：升级弹框的文字颜色错误(夜间模式下) \n'
            '2.修复：完成列表显示的的完成用时为负数 \n'
            '3.新增：留言展示墙！ \n',
      );

  String get version104 => Intl.message(
        'Version:1.0.4 \n\n'
        '1.Fixed: Search page overflow bugs, other small bugs \n'
        '2.Add: Account System.🎉 Celebrating github Star’s number over 500！ \n\n'
        'Todo: Sync task list information to the cloud \n',
        name: 'version104',
        desc: '版本:1.0.4 \n\n'
            '1.修复：搜索页面的控件溢出bug、其他各种小bug \n'
            '2.新增：账号系统!🎉庆祝github Star数过500！ \n\n'
            'Todo:任务列表信息同步至云端功能,麻麻再也不用担心我换手机啦\n',
      );

  String get version105 => Intl.message(
        'Version:1.0.5 \n\n'
        '1.Fixed: Fix the bug that the homepage returns to log in and then returns to the homepage to create a task that cannot be refreshed \n'
        '2.Optimization: upgrade popup display timeout error \n'
        '3.Add: 🎉 Sync tasks to the cloud! Ma Ma no longer have to worry about changing my phone! 🎉 \n',
        name: 'version105',
        desc: '版本:1.0.5 \n\n'
            '1.修复：从主页进入登录页登录后再进入主页后，创建task不能刷新的bug \n'
            '2.优化：升级弹窗显示timeout报错 \n'
            '3.新增：🎉任务同步至云端功能！麻麻再也不用担心我换手机啦！🎉 ',
      );

  String get version106 => Intl.message(
        'Version:1.0.6 \n\n'
        '1.Fixed: a lot of bugs due to the online account system. \n'
        '2.Optimization: now you can edit all icons when the icons\'s number is bigger than six  \n'
        '3.Add: You can set the network image as the background on the account page. \n',
        name: 'version106',
        desc: '版本:1.0.6 \n\n'
            '1.修复：大量因为上线账号系统,而新增的bug \n'
            '2.优化：当自定义图标数量不低于6个的时候，你可以任意编辑图标啦 \n'
            '3.新增：你可以在账号页面设置网络图片作为背景啦',
      );

  String get version107 => Intl.message(
        'Version:1.0.7 \n\n'
        '1.Fixed: some bugs had been discovered! \n'
        '2.Add: Now you can change your background to network image in main page!It will be very beautiful! \n',
        name: 'version107',
        desc: '版本:1.0.7 \n\n'
            '1.修复：已经发现的一些bug\n'
            '2.新增：现在可以将主页的背景更换为网络图片啦，非常漂亮哦！ \n',
      );

  String get version108 => Intl.message(
        'Version:1.0.8 \n\n'
        '1.Fixed: Now the validator of TextFormField will appear after you click the button \n'
        '2.Add: Now the network picture you have set will be shown in history page \n',
        name: 'version108',
        desc: '版本:1.0.8 \n\n'
            '1.修复：输入框的验证提示将会在点击按钮后显示\n'
            '2.新增：你使用过的网络背景图片现在可以在历史记录中找到了 \n',
      );

  String get version109 => Intl.message(
        'Version:1.0.9 \n\n'
        '1.Fixed:Input box cursor is not aligned with text \n'
        '2.Optimization:The sliding event of the task disc is no longer limited to the task icon, but is triggered on the entire disc \n'
        '3.Add: ✨Splash Animation!✨ \n',
        name: 'version109',
        desc: '版本:1.0.9 \n\n'
            '1.修复：输入框光标与文字不对齐的问题 \n'
            '2.优化：任务圆盘的滑动事件不再局限于任务图标，而是在整个圆盘上触发 \n'
            '3.新增：✨开场动画！✨ \n',
      );

  String get version110 => Intl.message(
        'Version:1.1.0 \n\n'
        '1.Fixed: Cannot enter text after clicking "Submit button" in task editing interface\n'
        '2.Optimization: the download process can be processed in the background; some pages have added network caches;\n'
        '3.New: 🚀Comprehensive, custom actions on task cards! 🚀\n'
        '4.Operation: Long press the homepage to enter the background setting interface; task editing interface can edit icons; \n',
        name: 'version110',
        desc: '版本:1.1.0 \n\n'
            '1.修复：任务编辑界面,点击"提交按钮"后无法输入文字 \n'
            '2.优化：下载过程可以在后台处理了;部分页面新增网络缓存; \n'
            '3.新增：🚀全面的、对任务卡片的自定义操作！🚀 \n'
            '4.操作：主页长按可进入背景设置界面;任务编辑界面可以进行图标编辑; \n',
      );

  String get version111 => Intl.message(
        'Version:1.1.1 \n\n'
        '1. Fix: Bugs you may have encountered or you have never encountered~~\n'
        '2. New: It is now possible to set the time period for automatically entering dark mode ^_^\n'
        '3. New: Local pictures can now be used directly in the picture background!!\n',
        name: 'version111',
        desc: '版本:1.1.1 \n\n'
            '1.修复：你可能已经遇到过,或者你从来没遇到过的bug~~ \n'
            '2.新增：现在可以设置自动进入夜间模式的时间段了 ^_^ \n'
            '3.新增：图片背景下现在可以直接使用本地图片了哦!! \n',
      );

  String get version112 => Intl.message(
        'Version:1.1.2 \n\n'
        '1. Fix: Bugs mentioned in FeedbackWallPage~~ \n'
        '2. New: Now you can change the background transparency of the task card!! \n'
        '3. Operation: Long press \' + \' button to pop up setting options \n',
        name: 'version112',
        desc: 'Version:1.1.2 \n\n'
            '1.Fix: Bugs mentioned in FeedbackWallPage~~ \n'
            '2.New: Now you can change the background transparency of the task card!! \n'
            '3.Operation: Long press \' + \' button to pop up setting options \n',
      );
}

//Locale代理类
class DemoLocalizationsDelegate
    extends LocalizationsDelegate<IntlLocalizations> {
  const DemoLocalizationsDelegate();

  //是否支持某个Local
  @override
  bool isSupported(Locale locale) => ['en', 'us'].contains(locale.languageCode);

  // Flutter会调用此类加载相应的Locale资源类
  @override
  Future<IntlLocalizations> load(Locale locale) {
    //3
    return IntlLocalizations.load(locale);
  }

  // 当Localizations Widget重新build时，是否调用load重新加载Locale资源.
  @override
  bool shouldReload(DemoLocalizationsDelegate old) => false;
}
