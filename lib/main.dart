import 'package:flutter/material.dart';
import 'package:flutter_rating_app/utils/system_ui.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

void main() =>
    runApp(const MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  double progress = 0;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this);
    _animationController.value = 0.5;
    _animationController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  //
  // @afifcodes
  // afifcodes.vercel.app
  //

  @override
  Widget build(BuildContext context) {
    systemUi();
    return Scaffold(
        backgroundColor: Colors.orange[50],
        body: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Transform.scale(
                    scale: 1.5,
                    child: Lottie.asset('assets/emoji.json',
                        width: double.infinity,
                        fit: BoxFit.cover,
                        controller: _animationController,
                        onLoaded: (composition) {
                      _animationController.duration = composition.duration;
                    }),
                  ),
                  Text(
                    'How was your experience',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                        letterSpacing: -2,
                        fontSize: 36,
                        fontWeight: FontWeight.w900),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        overlayShape:
                            const RoundSliderOverlayShape(overlayRadius: 0),
                        thumbShape: const RoundSliderThumbShape(
                            enabledThumbRadius: 6, disabledThumbRadius: 6)),
                    child: Slider(
                        value: progress,
                        activeColor: Colors.black,
                        onChanged: (val) {
                          setState(() {
                            progress = val;
                            _animationController.value = 0.5 + (val / 2);
                          });
                        }),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 12),
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(99)),
                      child: Text('Send',
                          style: GoogleFonts.inter(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.w700)))
                ])));
  }
}
