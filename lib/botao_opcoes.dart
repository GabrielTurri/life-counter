// import 'package:flutter/material.dart';

// class BotaoOpcoes extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return PopupMenuButton<String>(
//       style: ButtonStyle(iconColor: MaterialStateProperty.all(Colors.white)),
//       onSelected: handleClick,
//       itemBuilder: (BuildContext context) {
//         return {'Opções'}.map((String choice) {
//           return PopupMenuItem<String>(
//               value: choice,
//               child: const Text('Opções'),
//               onTap: () {
//                 OptionsDialog(onTap: );
//               });
//         }).toList();
//       },
//     );
//   }
// }

// class OptionsDialog extends StatefulWidget {
//   Function onTap;

//   OptionsDialog({required this.onTap});

//   @override
//   State<StatefulWidget> createState() => OptionsDialogState();
// }

// class OptionsDialogState extends State<OptionsDialog> {

//   Future<void> optionsDialogMenu(BuildContext context) {
//     return showDialog<void>(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('Opções'),
//           content: SizedBox(
//             height: 600,
//             child: Column(
//               children: [
//                 Row(
//                   children: [
//                     Text('Contadores ao contrário'),
//                     Switch(
//                       value: isRotated,
//                       onChanged: (value) {
//                         setState(() {
//                           isRotated = value;
//                         });
//                       },
//                     ),
//                   ],
//                 )
//               ],
//             ),
//           ),
//           actions: <Widget>[
//             TextButton(
//               style: TextButton.styleFrom(
//                 textStyle: Theme.of(context).textTheme.labelLarge,
//               ),
//               child: Text(
//                 'Salvar',
//                 style: TextStyle(color: Colors.green[600]),
//               ),
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     throw UnimplementedError();
//   }
// }
