import 'package:flutter/material.dart';
import 'package:wholay/styles.dart';
import 'package:wholay/widgets/appWidgets.dart';
import 'package:wholay/views/servantProfiles/myServiceProfileEntry.dart';

class MyServiceMainPage extends StatefulWidget {
  @override
  _MyServiceMainPageState createState() => _MyServiceMainPageState();
}

class _MyServiceMainPageState extends State<MyServiceMainPage> {
  @override
  Widget build(BuildContext context) {

    void showProfileEntryPage() {
      Navigator.push(
        context, 
        MaterialPageRoute(builder: (context) => MyServiceProfileEntryPage()),
      );
    }

    List<MyServiceTile> myServices = [
      MyServiceTile(
        serviceName: 'อเล็กซ์ช่างแอร์',
        starScore: 0,
        voter: 0,
        opened: true,
        showLowerDivide: true,
        onTap: () {
          showProfileEntryPage();
        },
      ),
      MyServiceTile(
        serviceName: 'อเล็กซ์คอมพิวเตอร์',
        starScore: 0.6,
        voter: 80,
        opened: true,
        showLowerDivide: true,
        onTap: () {
          showProfileEntryPage();
        },
      ),
      MyServiceTile(
        serviceName: 'อเล็กซ์ช่างไฟฟ้า',
        starScore: 1,
        voter: 3,
        opened: false,
        showLowerDivide: true,
        onTap: () {
          showProfileEntryPage();
        },
      ),
      MyServiceTile(
        serviceName: 'อเล็กซ์ Test 1',
        starScore: 1.5,
        voter: 99,
        opened: false,
        showLowerDivide: true,
        onTap: () {
          showProfileEntryPage();
        },
      ),
      MyServiceTile(
        serviceName: 'อเล็กซ์ Test 3',
        starScore: 2,
        voter: 300,
        opened: false,
        showLowerDivide: true,
        onTap: () {
          showProfileEntryPage();
        },
      ),
      MyServiceTile(
        serviceName: 'อเล็กซ์ Test 4',
        starScore: 2.5,
        voter: 180,
        opened: false,
        showLowerDivide: true,
        onTap: () {
          showProfileEntryPage();
        },
      ),
      MyServiceTile(
        serviceName: 'อเล็กซ์ Test 5',
        starScore: 3,
        voter: 39,
        opened: false,
        showLowerDivide: true,
        onTap: () {
          showProfileEntryPage();
        },
      ),
      MyServiceTile(
        serviceName: 'อเล็กซ์ Test 6',
        starScore: 3.5,
        voter: 390,
        opened: true,
        showLowerDivide: true,
        onTap: () {
          showProfileEntryPage();
        },
      ),
      MyServiceTile(
        serviceName: 'อเล็กซ์ Test 7',
        starScore: 4,
        voter: 77,
        opened: true,
        showLowerDivide: true,
        onTap: () {
          showProfileEntryPage();
        },
      ),
      MyServiceTile(
        serviceName: 'อเล็กซ์ Test 8',
        starScore: 4.5,
        voter: 77,
        opened: true,
        showLowerDivide: true,
        onTap: () {
          showProfileEntryPage();
        },
      ),
      MyServiceTile(
        serviceName: 'อเล็กซ์ Test 9',
        starScore: 5,
        voter: 77,
        opened: true,
        showLowerDivide: true,
        onTap: () {
          showProfileEntryPage();
        },
      ),
      MyServiceTile(
        serviceName: 'อเล็กซ์ Test 10',
        starScore: 5.5,
        voter: 101,
        opened: true,
        showLowerDivide: true,
        onTap: () {
          showProfileEntryPage();
        },
      ),
    ];

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: WholayColors.surface,
      appBar: AppBar(
        leading: IconButton(
          icon: ClosePageIcon(), // Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('บริการของฉัน'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add, size: WholaySpace.headIconSize),
            onPressed: () {
              showProfileEntryPage();
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(WholaySpace.edgeHorizontal),
              child: Text(
                'บริการของฉัน คือ บริการที่คุณสร้างขึ้นเพื่อให้บริการแก่ผู้อื่น คุณสามารถระบุรายละเอียดการให้บริการและกำหนดค่าบริการได้ด้วยตัวคุณเอง '
                'มาสร้างงานบริการของคุณกันเดี๋ยวนี้เลย',
                style: minorLabelStyle(context),
              ),
            ),
            lineDivide(null),
            Container(
              color: WholayColors.backgroundSecondary,
              padding: EdgeInsets.symmetric(horizontal: WholaySpace.edgeHorizontal, vertical: 5.0),
              alignment: Alignment.centerLeft,
              child: Text(
                'จำนวนบริการทั้งหมด ${myServices.length.toString()}',
                style: minorLabelStyle(context),
                textAlign: TextAlign.left,
              ),
            ),
            lineDivide(null),
            Visibility(
              visible: (myServices.length > 0),
              child: Expanded(
                child: ListView.builder(
                  itemCount: myServices.length + 1,
                  itemBuilder: (context, index) {
                    return (index == myServices.length) ? SizedBox(height: 90.0) : myServices[index];
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {showProfileEntryPage();},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}