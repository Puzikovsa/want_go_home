import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:want_go_home/main.dart';
import 'package:want_go_home/models/phone.dart';

class AddPhone extends ConsumerStatefulWidget {
  const AddPhone({super.key});

  @override
  ConsumerState<AddPhone> createState() => _AddPhoneState();
}

class _AddPhoneState extends ConsumerState<AddPhone> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 20,
        right: 20,
        top: 20,
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Column(
        children: [
          TextFormField(
            keyboardType: TextInputType.number,
            maxLength: 11,
            controller: _controller,
          ),
          ElevatedButton(
            onPressed: () {
              ref
                  .read(nameProvider.notifier)
                  .update((state) => _controller.text);
              Navigator.pop(context);
            },
            child: const Text('Сохранить'),
          ),
        ],
      ),
    );
  }
}
