import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecom/business/screens/signup.dart';

enum Page { dashboard, manage }

class Admin extends StatefulWidget {
  @override
  _AdminState createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  Page _selectedPage = Page.dashboard;
  MaterialColor active = Colors.amber;
  MaterialColor notActive = Colors.red;
  TextEditingController categoryController = TextEditingController();
  TextEditingController brandController = TextEditingController();
  GlobalKey<FormState> _categoryFormKey = GlobalKey();
  GlobalKey<FormState> _brandFormKey = GlobalKey();
  //TODO add this database models
  // BrandService _brandService = BrandService();
  // CategoryService _categoryService = CategoryService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: <Widget>[
            Expanded(
              child: FlatButton.icon(
                onPressed: () {
                  setState(() => _selectedPage = Page.dashboard);
                },
                icon: Icon(
                  Icons.dashboard,
                  color: _selectedPage == Page.dashboard ? active : notActive,
                ),
                label: Text('Dashboard'),
              ),
            ),
            Expanded(
              child: FlatButton.icon(
                onPressed: () {
                  setState(() => _selectedPage = Page.manage);
                },
                icon: Icon(
                  Icons.sort,
                  color: _selectedPage == Page.dashboard ? active : notActive,
                ),
                label: Text('Manage`'),
              ),
            ),
          ],
        ),
        backgroundColor: Colors.white,
      ),
      body: _loadScreen(),
    );
  }

  Widget _loadScreen() {
    switch (_selectedPage) {
      case Page.dashboard:
        return Column(
          children: [
            ListTile(
              subtitle: FlatButton.icon(
                onPressed: () {},
                icon: Icon(
                  Icons.attach_money,
                  size: 30.0,
                  color: Colors.green,
                ),
                label: Text(
                  '12,000',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 30.0, color: Colors.green),
                ),
              ),
              title: Text(
                'Revenue',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24.0, color: Colors.grey),
              ),
            ),
            Expanded(
              child: GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Card(
                      child: ListTile(
                        title: FlatButton.icon(
                          onPressed: () {},
                          icon: Icon(Icons.people_outline),
                          label: Text('Users'),
                        ),
                        subtitle: Text(
                          '7',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: active, fontSize: 60.0),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Card(
                      child: ListTile(
                        title: FlatButton.icon(
                          onPressed: () {},
                          icon: Icon(Icons.category),
                          label: Expanded(child: Text('Categories')),
                        ),
                        subtitle: Text(
                          '23',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: active, fontSize: 60.0),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Card(
                      child: ListTile(
                        title: FlatButton.icon(
                          onPressed: () {},
                          icon: Icon(Icons.track_changes),
                          label: Expanded(child: Text('Products')),
                        ),
                        subtitle: Text(
                          '120',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: active, fontSize: 60.0),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Card(
                      child: ListTile(
                        title: FlatButton.icon(
                          onPressed: () {},
                          icon: Icon(Icons.tag_faces),
                          label: Text('Sold'),
                        ),
                        subtitle: Text(
                          '13',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: active, fontSize: 60.0),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Card(
                      child: ListTile(
                        title: FlatButton.icon(
                          onPressed: () {},
                          icon: Icon(Icons.shopping_cart),
                          label: Text('Orders'),
                        ),
                        subtitle: Text(
                          '5',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: active, fontSize: 60.0),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Card(
                      child: ListTile(
                        title: FlatButton.icon(
                          onPressed: () {},
                          icon: Icon(Icons.close),
                          label: Text('Return'),
                        ),
                        subtitle: Text(
                          '0',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: active, fontSize: 60.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        );
        break;
      case Page.manage:
        return ListView(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.add),
              title: Text('Add Products'),
              onTap: () {},
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.change_history),
              title: Text('Products List'),
              onTap: () {},
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.add_circle),
              title: Text('Add Category'),
              onTap: () {
                //TODO create _categoryAlert()
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.category),
              title: Text('Category List'),
              onTap: () {},
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.add_circle_outline),
              title: Text('Add Brand'),
              onTap: () {
                //TODO create _brandAlert()
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.library_books),
              title: Text('Brand list'),
              onTap: () {},
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.library_books),
              title: Text('Log Out'),
              onTap: () {
                FirebaseAuth auth = FirebaseAuth.instance;
                auth.signOut().then((res) {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => SignUp()),
                      (Route<dynamic> route) => false);
                });
              },
            ),
            Divider(),
          ],
        );
        break;
      default:
        return Container();
    }
  }
//TODO create _categoryAlert()
//TODO create _brandAlert()
}
