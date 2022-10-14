import 'package:currency_app/models/currency_model.dart';
import 'package:currency_app/services/currency_service.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Currency App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  CurrencyService _currencyService = CurrencyService();
  List<TCMBAnlikKurBilgileri> currencies = [];

  @override
  void initState() {
    setState(() {
      _currencyService.fetchCurrency().then((value) {
        if (value != null && value.tCMBAnlikKurBilgileri != null) {
          currencies = value!.tCMBAnlikKurBilgileri!;
        } else {
          print("Unsuccesful Process");
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(30, 20, 30, 20),
              width: 150,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.yellow[700]),
              height: 150,
              child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Altın Hesabı", style: TextStyle(color: Colors.white)),
                    Text(
                      "120,00 Gr",
                      style: TextStyle(color: Colors.white),
                    )
                  ]),
            ),
            CurrencyList(
                currencyService: _currencyService, currencies: currencies),
          ],
        ),
      ),
    );
  }
}

class CurrencyList extends StatelessWidget {
  const CurrencyList({
    Key? key,
    required CurrencyService currencyService,
    required this.currencies,
  })  : _currencyService = currencyService,
        super(key: key);

  final CurrencyService _currencyService;
  final List<TCMBAnlikKurBilgileri> currencies;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _currencyService.fetchCurrency(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.none) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return ListView.builder(
            itemCount: currencies.length - 11,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return ListTile(
                onTap: () => print("a"),
                title: Text(currencies[index].currencyName!,
                    style: TextStyle(color: Colors.black)),
                leading: Icon(Icons.account_balance),
                trailing: Text("${currencies[index].banknoteSelling}"),
              );
            },
          );
        }
      },
    );
  }
}
