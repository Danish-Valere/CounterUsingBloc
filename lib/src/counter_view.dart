import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter_cubit.dart';

class CounterView extends StatefulWidget {
  const CounterView({Key? key}) : super(key: key);

  @override
  State<CounterView> createState() => _CounterViewState();
}

class _CounterViewState extends State<CounterView> {
  void drawnavigate() {
    ElevatedButton(
        onPressed: (() => Navigator.pop(context)), child: Text('data'));
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'COUNTER',
        ),
        centerTitle: false,
        backgroundColor: Colors.purple,
      ),
      //endDrawer: for showing drawer at the end ,
      drawer: const Drawer(
        child: ListTile(
          title: Padding(
            padding: EdgeInsets.only(top: 28.0),
            child: Text('MAIN TITLE'),
          ),
          subtitle: Icon(
            Icons.exit_to_app,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              ListTile(
                leading: Icon(
                  Icons.search_sharp,
                  size: 38,
                ),
                title: TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      suffix: Icon(
                        Icons.cancel,
                        size: 19,
                      )),
                ),
                // trailing: Icon(Icons.cancel),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(28.0),
            child: Column(
              children: [
                Center(
                  child: BlocBuilder<CounterCubit, int>(
                    builder: (context, state) {
                      return Text('Counter : $state',
                          style: textTheme.headline4);
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),

      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            // key: const Key('counterView_increment_floatingActionButton'),
            child: const Icon(Icons.add),
            onPressed: () => context.read<CounterCubit>().increment(),
          ),
          const SizedBox(height: 8),
          FloatingActionButton(
            //key: const Key('counterView_decrement_floatingActionButton'),
            child: const Icon(Icons.remove),
            onPressed: () => context.read<CounterCubit>().decrement(),
          ),
          BottomNavigationBar(
              backgroundColor: Colors.amber,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                  backgroundColor: Colors.red,
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.search),
                    label: 'search',
                    backgroundColor: Colors.red),
                BottomNavigationBarItem(
                    icon: Icon(Icons.settings),
                    label: 'setting',
                    backgroundColor: Colors.red),
              ])
        ],
      ),
    );
  }
}
