import 'package:bookflow/bloc/the_loop_blocs/theloop_theme/theloop_theme_event.dart';
import 'package:bookflow/bloc/the_loop_blocs/theloop_theme/theloop_theme_state.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

double mapFontSizeEnumToDouble(FontSize fontSize) {
  switch (fontSize) {
    case FontSize.small:
      return 38.0;
    case FontSize.medium:
      return 50.0;
    case FontSize.big:
      return 68.0;
    default:
      return 50.0; // default size, ideally never reached
  }
}

class TheloopThemeBloc extends Bloc<TheloopThemeEvent, TheloopThemeState> {
  TheloopThemeBloc() : super(TheloopThemeInitial()) {
    // Initialize theme based on saved preferences
    _initTheme();
    _initFont();
    _initFontSize();
    on<TheloopThemeSetOriginal>((event, emit) {
      emit(TheloopThemeOriginal());
      _saveThemeToPrefs('TheloopThemeOriginal');
    });

    on<TheloopThemeSetQuiet>((event, emit) {
      emit(TheloopThemeQuiet());
      _saveThemeToPrefs('TheloopThemeQuiet');
    });

    on<TheloopThemeSetPaper>((event, emit) {
      emit(TheloopThemePaper());
      _saveThemeToPrefs('TheloopThemePaper');
    });

    on<TheloopThemeSetDarkLight>((event, emit) {
      emit(TheloopThemeDarkLight());
      _saveThemeToPrefs('TheloopThemeDarkLight');
    });

    on<TheloopThemeSetCalm>((event, emit) {
      emit(TheloopThemeCalm());
      _saveThemeToPrefs('TheloopThemeCalm');
    });

    on<TheloopThemeSetFocus>((event, emit) {
      emit(TheloopThemeFocus());
      _saveThemeToPrefs('TheloopThemeFocus');
    });

    on<SetGradient1>((event, emit) {
      emit(TheLoopGradient1());
      _saveThemeToPrefs('TheloopThemeGradient1');
    });
    on<SetTunnel>((event, emit) {
      emit(TheLoopTunnel());
      _saveThemeToPrefs('TheloopThemeTunnel');
    });

    on<SetFontSizeEvent>((event, emit) {
      final currentState = state;
      double newSize = mapFontSizeEnumToDouble(event.newFontSize);
      emit(
        ConcreteTheloopThemeState(
          currentState.fontName,
          event.newFontSize,
          currentState.mainTextColor,
          currentState.wpmTextColor,
          currentState.backgroundColor,
          currentState.allowImageSwitch,
          currentState.progress,
          currentState.assetPath,
        ),
      );
      _saveFontSizeToPrefs(newSize);
    });

// Initialize Font Size from Shared Preferences

    on<SetFontEvent>((event, emit) {
      final currentState = state;
      emit(
        ConcreteTheloopThemeState(
          event.newFontName,
          currentState.fontSize,
          currentState.mainTextColor,
          currentState.wpmTextColor,
          currentState.backgroundColor,
          currentState.allowImageSwitch,
          currentState.progress,
          currentState.assetPath,
        ),
      );
      _saveFontToPrefs(event.newFontName);
    });

    on<UpdateProgressEvent>((event, emit) {
      int index = (event.progress * 10).toInt();

      // Check if index is different from the last index
      if (lastIndex != index) {
        // Update lastIndex to the current index
        lastIndex = index;

        String newImagePath = backgroundImages[index % backgroundImages.length];

        final currentState = state;

        if (currentState.allowImageSwitch) {
          String newImagePath =
              backgroundImages[index % backgroundImages.length];

          emit(TheloopThemeSwitchImage(
            currentState.fontName,
            currentState.mainTextColor,
            currentState.wpmTextColor,
            currentState.backgroundColor,
            currentState
                .allowImageSwitch, // You can set this to true or derive from your state.
            newImagePath,
            event.progress,
          ));
        }
      }
    });
  }

  void _initFont() async {
    final prefs = await SharedPreferences.getInstance();
    final savedFont = prefs.getString('font');

    if (savedFont != null) {
      add(SetFontEvent(newFontName: savedFont));
    }
  }

  void _initTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final savedTheme = prefs.getString('theme');

    if (savedTheme != null) {
      switch (savedTheme) {
        case 'TheloopThemeOriginal':
          add(TheloopThemeSetOriginal());
          break;
        case 'TheloopThemeQuiet':
          add(TheloopThemeSetQuiet());
          break;
        case 'TheloopThemePaper':
          add(TheloopThemeSetPaper());
          break;
        case 'TheloopThemeDarkLight':
          add(TheloopThemeSetDarkLight());
          break;
        case 'TheloopThemeCalm':
          add(TheloopThemeSetCalm());
          break;
        case 'TheloopThemeFocus':
          add(TheloopThemeSetFocus());
          break;

        case 'TheloopThemeGradient1':
          add(SetGradient1());
          break;
        case 'TheloopThemeTunnel':
          add(SetTunnel());
          break;
        default:
          break;
      }
    } else {
      // Handle the case when no theme is saved in prefs; perhaps load a default theme
    }
  }

  void _initFontSize() async {
    final prefs = await SharedPreferences.getInstance();
    final savedSize = prefs.getDouble('fontSize');

    if (savedSize != null) {
      // Convert double to your FontSize enum
      FontSize fontSizeEnum = FontSize.medium; // Default
      if (savedSize == 38.0) {
        fontSizeEnum = FontSize.small;
      } else if (savedSize == 50.0) {
        fontSizeEnum = FontSize.medium;
      } else if (savedSize == 68.0) {
        fontSizeEnum = FontSize.big;
      }
      add(SetFontSizeEvent(newFontSize: fontSizeEnum));
    }
  }

  // Save to Shared Preferences
  void _saveFontSizeToPrefs(double fontSize) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('fontSize', fontSize);
  }

  void _saveThemeToPrefs(String theme) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('theme', theme);
  }

  void _saveFontToPrefs(String font) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('font', font);
  }

  int lastIndex = -1;

  final List<String> backgroundImages = [
    'assets/images/tunneld1.png',
    'assets/images/tunneld2.png',
    'assets/images/tunneld3.png',
    'assets/images/tunneld4.png',
    'assets/images/tunneld5.png',
    'assets/images/tunneld6.png',
    'assets/images/tunneld7.png',
    'assets/images/tunneld8.png',
    'assets/images/tunneld9.png',
    'assets/images/tunneld10.png',
  ];
}
