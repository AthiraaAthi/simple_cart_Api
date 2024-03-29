import 'package:flutter/material.dart';
import 'package:new_api_try/controller/my_controller.dart';
import 'package:new_api_try/model/my_model.dart';
import 'package:new_api_try/view/cart_page.dart';
import 'package:new_api_try/view/home_screen_widget.dart';

import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  SampleApi sampleApiobj = SampleApi();
  @override
  void initState() {
    fetchdata();
    super.initState();
  }

  Future<void> fetchdata() async {
    await Provider.of<MyController>(context, listen: false).fetchData();
  }

  @override
  Widget build(BuildContext context) {
    final MyControllerobj = Provider.of<MyController>(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CartPage(),
                  ));
            },
            icon: Icon(
              Icons.shopping_cart,
              size: 30,
            ),
          )
        ],
        title: Text("Lets try"),
      ),
      body: GridView.builder(
        scrollDirection: Axis.vertical,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisExtent: 270,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          crossAxisCount: 2,
        ),
        itemCount: MyControllerobj.sampleApiobj.products?.length,
        itemBuilder: (context, index) => HomeScreenWidget(
          title: MyControllerobj.sampleApiobj.products?[index].title ?? " ",
          image: MyControllerobj.sampleApiobj.products?[index].thumbnail ?? " ",
          price: MyControllerobj.sampleApiobj.products?[index].price,
        ),
      ),
    );
  }
}
