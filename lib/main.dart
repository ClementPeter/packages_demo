import 'package:flutter/material.dart';
import 'package:packages_demo/hive.dart';
import 'package:packages_demo/homepage.dart';
import 'package:packages_demo/smooth_scrolling.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Packages Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Packages Demo'),
      //home: ScrollingIndicatorPage(),
    );
  }
}

//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
///Hive demo snippet (Buggedd)

// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:hive_flutter/hive_flutter.dart';

// void main() async {
//   //Setup HIVE
//   WidgetsFlutterBinding.ensureInitialized();
//   await Hive.initFlutter();

//   //Create Hive DB where Data would be stored offline
//   await Hive.openBox('shoppingBox');
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Hive Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const HivePage(title: 'Hive Demo'),
//     );
//   }
// }

// class HivePage extends StatefulWidget {
//   const HivePage({super.key, required this.title});

//   final String title;

//   @override
//   State<HivePage> createState() => _HivePageState();
// }

// class _HivePageState extends State<HivePage> {
//   //Reference the created HIVE box to store and extract data from
//   final shoppingBox = Hive.box('shoppingBox');

//   //Hive storage passes data here to be displayed in the UI
//   List<Map<String, dynamic>> items = [];

//   //Create item to be passed to hive using Map
//   Future<void> createItem(Map<String, dynamic> newItem) async {
//     await shoppingBox.add(newItem);
//     print(":::amount of items in hive: ${shoppingBox.length}:::");
//     print(":::keys of items in hive: ${shoppingBox.keys}:::");
//     print(":::values of items in hive: ${shoppingBox.values}:::");
//     refreshItem();
//   }

//   //Update Item
//   Future<void> updateItem(int itemKey, Map<String, dynamic> item) async {
//     await shoppingBox.put(itemKey, item);
//     refreshItem();
//   }

//   //Delete Item
//   Future<void> deleteItem(int itemKey) async {
//     await shoppingBox.delete(itemKey);
//     refreshItem();
//   }

//   //converts hive data to a list of maps and return a List of which we can pass into a ListView.builder
//   void refreshItem() {
//     final data = shoppingBox.keys.map((key) {
//       //get the values from the keys values of the Hive DB
//       final item = shoppingBox.get(key);
//       return {"key": key, "name": item["name"], "quantity": item["quantity"]};
//     }).toList();

//     //update the data and pass it to items which refreshes the UI
//     setState(() {
//       //Store it into the empty List of Item
//       // items = data.reversed.toList();
//       items = data.toList();
//       print(":::items in List: ${items.length}:::");
//     });
//   }

//   //controllers
//   final TextEditingController _nameController = TextEditingController();
//   final TextEditingController _quantityController = TextEditingController();

//   //show form bottom modal sheet
//   void showForm(BuildContext ctx, int? itemKey) async {
//     //if item is not equal to null ; meaning a key is provided then we are editing an item
//     if (itemKey != null) {
//       final existingItem =
//           items.firstWhere((element) => element["key"] == itemKey);

//       //set the text of the controller to the existing item name
//       _nameController.text = existingItem["name"];
//       _quantityController.text = existingItem["quantity"];
//     }

//     showModalBottomSheet(
//         isScrollControlled: true,
//         context: context,
//         builder: (context) {
//           return Container(
//             padding: EdgeInsets.only(
//               bottom: MediaQuery.of(ctx).viewInsets.bottom,
//               top: 15,
//               left: 15,
//               right: 15,
//             ),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               crossAxisAlignment: CrossAxisAlignment.end,
//               children: [
//                 TextField(
//                   controller: _nameController,
//                   decoration: const InputDecoration(
//                     labelText: 'Name',
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//                 TextField(
//                   controller: _quantityController,
//                   decoration: const InputDecoration(
//                     labelText: 'Quantity',
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 ElevatedButton(
//                   onPressed: () async {
//                     if (itemKey == null) {
//                       await createItem({
//                         "name": _nameController.text,
//                         "quantity": _quantityController.text,
//                       });
//                     }

//                     if (itemKey != null) {
//                       await updateItem(itemKey, {
//                         "name": _nameController.text,
//                         "quantity": _quantityController.text,
//                       });
//                     }

//                     _nameController.text = "";
//                     _quantityController.text = "";
//                     //Navigator.of(context).pop();
//                   },
//                   child: Text(itemKey == null ? "Create Item" : "Update Item"),
//                 )
//               ],
//             ),
//           );
//         });
//   }

//   @override
//   Widget build(BuildContext context) {
//     ScrollController scrollController = ScrollController();
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//         centerTitle: true,
//       ),
//       body: ListView.builder(
//           controller: scrollController,
//           itemCount: items.length,
//           itemBuilder: (context, index) {
//             return ListTile(
//               title: Text("${items[index]["name"]}"),
//               subtitle: Text("${items[index]["quantity"]}"),
//               trailing: Row(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   //edit button
//                   IconButton(
//                     icon: const Icon(Icons.edit),
//                     onPressed: () {
//                       showForm(context, items[index]["key"]);
//                       // updateItem(items[index]["key"],
//                       // {} );
//                     },
//                   ),
//                   //delete button
//                   IconButton(
//                     icon: const Icon(Icons.delete),
//                     onPressed: () {
//                       deleteItem(items[index]["key"]);
//                       // shopping_box.delete(items[index]["key"]);
//                       // refreshItem();
//                     },
//                   ),
//                 ],
//               ),
//               //update item widget
//               // onTap: () {
//               //   showForm(context, items[index]["key"]);
//               // },
//             );
//           }),
//       // floatingActionButton: FloatingActionButton(
//       //   isExtended: true,
//       //   onPressed: () {
//       //     showForm(context, null);
//       //   },
//       //   child: const Icon(Icons.add),
//       // ),
//       floatingActionButton: CustomFAB(
//         scrollController: scrollController,
//         //showForm: showForm()
//       ),
//     );
//   }
// }

// class CustomFAB extends StatefulWidget {
//   const CustomFAB({
//     super.key,
//     required this.scrollController,
//     //required this.showForm,
//   });

//   final ScrollController scrollController;

//   showForm(BuildContext context, int? itemKey) {}

//   @override
//   State<CustomFAB> createState() => _CustomFABState();
// }

// class _CustomFABState extends State<CustomFAB> {
//   //
//   @override
//   void initState() {
//     //Adding callback function for scroll controller
//     widget.scrollController.addListener(() {
//       if (widget.scrollController.position.userScrollDirection ==
//           ScrollDirection.reverse) {
//         if (isVisible != false) {
//           setState(() {
//             isVisible = false;
//           });
//         } else {
//           if (isVisible != true) {
//             setState(() {
//               isVisible = true;
//             });
//           }
//         }
//       }
//     });

//     super.initState();
//   }

//   bool isVisible = true;
//   @override
//   Widget build(BuildContext context) {
//     return Visibility(
//       visible: isVisible,
//       child: FloatingActionButton(
//         isExtended: isVisible,
//         onPressed: () {
//           //showForm(context, null);
//           // widget.showForm();
//         },
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }
