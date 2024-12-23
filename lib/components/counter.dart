// import 'package:jaspr/jaspr.dart';

// import '../constants/theme.dart';

// class Counter extends StatefulComponent {
//   const Counter({super.key});

//   @override
//   State<Counter> createState() => CounterState();
// }

// class CounterState extends State<Counter> {
//   int count = 0;

//   @override
//   Iterable<Component> build(BuildContext context) sync* {
//     yield div(classes: 'counter', [
//       button(
//         onClick: () {
//           setState(() => count--);
//         },
//         [text('-')],
//       ),
//       span([text('$count')]),
//       button(
//         onClick: () {
//           setState(() => count++);
//         },
//         [text('+')],
//       ),
//     ]);
//   }

//   @css
//   static final styles = [
//     css('.counter', [
//       css('&').flexbox(alignItems: AlignItems.center).box(
//             padding: EdgeInsets.symmetric(vertical: 10.px),
//             border: Border.symmetric(vertical: BorderSide.solid(color: primaryColor, width: 1.px)),
//           ),
//       css('button', [
//         css('&')
//             .text(fontSize: 2.rem)
//             .box(width: 2.em, height: 2.em, border: Border.unset, cursor: Cursor.pointer)
//             .box(radius: BorderRadius.all(Radius.circular(2.em)))
//             .flexbox(justifyContent: JustifyContent.center, alignItems: AlignItems.center)
//             .background(color: Colors.transparent),
//         css('&:hover').background(color: const Color.hex('#0001')),
//       ]),
//       css('span') //
//           .box(padding: EdgeInsets.symmetric(horizontal: 2.rem), boxSizing: BoxSizing.borderBox, minWidth: 2.5.em)
//           .text(color: primaryColor, fontSize: 4.rem, align: TextAlign.center),
//     ]),
//   ];
// }

import 'package:jaspr/jaspr.dart';
import 'package:jaspr_riverpod/jaspr_riverpod.dart';
import 'package:wow_token/providers/count_provider.dart';

import 'button.dart';

class Counter2 extends StatelessComponent {
// with SyncProviderDependencies {
  /// Specify which SyncProviders to preload before executing build().
  ///
  /// This makes sure that the value of the specified providers is directly
  /// available when build() is called, even if its an asynchronous value.
  // @override
  // Iterable<SyncProvider> get preloadDependencies => [initialCountProvider];

  @override
  Iterable<Component> build(BuildContext context) sync* {
    // yield Button(
    //   label: 'Click Me',
    //   onPressed: () {
    //     context.read(countProvider.notifier).state++;
    //   },
    // );

    final count = context.watch(countProvider);

    yield button([text("click2")],
        onClick: (){
          print("click");
          
          context.read(countProvider.notifier).state = count + 1;

        }
    );

    yield DomComponent(
      tag: 'span',
      child: Text('Counter: $count'),
    );

    yield Builder(
  builder: (context) sync* {
    var value = context.watch(countProvider);
    yield  Text(value.toString());
  },
);
  }
}
