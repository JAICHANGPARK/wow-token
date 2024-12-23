import 'package:jaspr/jaspr.dart';
import 'package:wow_token/components/counter.dart';

class FabButtonComponent extends StatefulComponent {
  State<FabButtonComponent> createState() => FabButtonComponentState();
}

class FabButtonComponentState extends State<FabButtonComponent> {
  int count = 0;
  int count1 = 0;

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield div(
      classes: "fixed bottom-4 right-4 flex flex-col items-center",
      [
        span(
          classes: "mb-2 text-gray-700 text-sm",
          [text("count: ${count.toString()}"),],),
        span(
          classes: "mb-2 text-gray-700 text-sm",
          [text("count1: ${count1.toString()}"),],),
        button(
          classes:
              "bg-blue-500 hover:bg-blue-600 text-white rounded-full p-4 shadow-lg",
          [
            text("클릭 ${count}"),
          ],
          onClick: () {
            setState(() {
              count += 1;
            });
          },
        ),
        Counter2()
      ],
      // classes: "fixed bottom-4 right-4",
    );
  }
}

// <div class="fixed bottom-4 right-4">
//   <button class="bg-blue-500 hover:bg-blue-600 text-white rounded-full p-4 shadow-lg">
//     <!-- 아이콘 또는 텍스트 -->
//     <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
//       <path stroke-linecap="round" stroke-linejoin="round" d="M12 4v16m8-8H4" />
//     </svg>
//   </button>
// </div>
