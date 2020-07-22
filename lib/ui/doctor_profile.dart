import 'package:doctorapp/models/doctor.dart';
import 'package:flutter/material.dart';

class DoctorInfoViewPage extends StatefulWidget {
  DoctorInfoViewPage({Key key}) : super(key: key);

  @override
  _DoctorInfoViewPageState createState() => _DoctorInfoViewPageState();
}

class _DoctorInfoViewPageState extends State<DoctorInfoViewPage> {
  final doctor = Doctor(
    name: "Yasin",
    surname: "Ege",
    experience: 25,
    rating: 1555,
    patientCount: 15,
    workingTime: "Mon - Sat (08:30 AM - 09:00 PM)",
    profilePhoto:
        "https://www.gravatar.com/avatar/205e460b479e2e5b48aec07710c08d50.jpg?s=100",
    details: "Some details",
    department: "Test",
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: SafeArea(
          child: CustomScrollView(
            slivers: <Widget>[
              buildSliverAppBar(),
              buildSliverList(),
            ],
          ),
        ),
      ),
    );
  }

  SliverAppBar buildSliverAppBar() {
    return SliverAppBar(
      backgroundColor: Colors.white10,
      expandedHeight: 200.0,
      flexibleSpace: FlexibleSpaceBar(
        background: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Center(
                child: CircleAvatar(
              radius: 60.0,
              backgroundImage: NetworkImage(doctor.profilePhoto),
            )),
          ],
        ),
      ),
      actions: buildActions(),
    );
  }

  Column buildDoctorNameAndSurname() {
    return Column(
      children: <Widget>[
        Text(
          doctor.name,
          style: buildTextStyleDoctorName(),
        ),
        SizedBox(height: 10),
        Text(
          "SELAM",
          style: buildTextStyleSurname(),
        ),
      ],
    );
  }

  SliverList buildSliverList() {
    return SliverList(
      delegate: SliverChildListDelegate(
        <Widget>[
          buildInfoCards(),
          SizedBox(height: 10),
          buildBottomCard([
            buildCardItem(
              "About Doctor",
              Text(doctor.details),
            ),
            SizedBox(height: 30),
            buildCardItem(
              "Working time",
              Text(
                doctor.workingTime,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black.withOpacity(0.7),
                  fontSize: 18,
                ),
              ),
            ),
            SizedBox(height: 30),
            buildCardItem(
              "Communication",
              buildCommunicationList(),
            ),
            SizedBox(height: 50),
            buildBottomButton()
          ]),
        ],
      ),
    );
  }

  Widget buildInfoCards() {
    return Expanded(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          buildInfoCard(
            Icon(Icons.people, color: Colors.blue),
            Colors.blue.withOpacity(0.1),
            doctor.patientCount.toString() + "+",
            "Patients",
          ),
          buildInfoCard(
            Icon(Icons.stars, color: Colors.black.withOpacity(0.3)),
            Colors.green.withOpacity(0.1),
            doctor.experience.toString() + " Yrs",
            "Experience",
          ),
          buildInfoCard(
            Icon(Icons.star_border, color: Colors.orange.withOpacity(0.6)),
            Colors.orange.withOpacity(0.1),
            doctor.rating.toString(),
            "Ratings",
          ),
        ],
      ),
    );
  }

  Column buildCardItem(String title, Widget child) {
    return Column(
      children: <Widget>[
        Align(
            alignment: Alignment.centerLeft,
            child: Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            )),
        SizedBox(height: 10),
        Align(alignment: Alignment.topLeft, child: child),
      ],
    );
  }

  List<Widget> buildActions() {
    return <Widget>[
      IconButton(
        icon: const Icon(
          Icons.more_vert,
          color: Colors.black,
        ),
        tooltip: 'Add new entry',
        onPressed: () {/* ... */},
      ),
    ];
  }

  Widget buildInfoCard(
    Icon icon,
    Color color,
    String primaryText,
    String secondaryText,
  ) {
    return SizedBox(
      width: 110,
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: <Widget>[
            buildInfoCardTopIcon(icon, color),
            SizedBox(height: 15),
            Text(
              primaryText,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            Text(
              secondaryText,
              style: TextStyle(
                color: Colors.black.withOpacity(0.6),
                fontSize: 12,
              ),
            ),
            SizedBox(height: 10)
          ],
        ),
      ),
    );
  }

  SizedBox buildBottomButton() {
    return SizedBox(
      width: double.infinity,
      child: RaisedButton(
        color: Colors.grey.withOpacity(0.7),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        onPressed: () {},
        child: Padding(
          padding: const EdgeInsets.only(
            top: 20,
            bottom: 20,
          ),
          child: Text(
            "Book Appointment",
            style: TextStyle(
              color: Colors.white.withOpacity(0.6),
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }

  ClipRRect buildInfoCardTopIcon(Icon icon, Color color) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15)),
      child: ColoredBox(
        color: color,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              SizedBox(height: 20),
              icon,
            ],
          ),
        ),
      ),
    );
  }

  Card buildBottomCard(List<Widget> list) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: list,
        ),
      ),
    );
  }

  Column buildCommunicationList() {
    return Column(
      children: <Widget>[
        buildCommunicationItem(
          "Messaging",
          "Chat me up, share photos.",
          Icon(Icons.message, color: Colors.grey),
          Colors.green.withOpacity(0.3),
        ),
        SizedBox(height: 10),
        buildCommunicationItem(
          "Audio Call",
          "Call your doctor directly.",
          Icon(Icons.phone, color: Colors.blue),
          Colors.grey.withOpacity(0.3),
        ),
        SizedBox(height: 10),
        buildCommunicationItem(
          "Video Call",
          "See you doctor live.",
          Icon(Icons.video_call, color: Colors.orange),
          Colors.orange.withOpacity(0.2),
        )
      ],
    );
  }

  Row buildCommunicationItem(
    String title,
    String subTitle,
    Icon icon,
    Color color,
  ) {
    return Row(
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: ColoredBox(
            color: color,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: icon,
            ),
          ),
        ),
        SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black.withOpacity(0.7),
                fontSize: 18,
              ),
            ),
            SizedBox(height: 5),
            Text(
              subTitle,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black.withOpacity(0.4),
                fontSize: 15,
              ),
            ),
          ],
        )
      ],
    );
  }

  TextStyle buildTextStyleSurname() {
    return TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.black.withOpacity(0.6),
      fontSize: 14,
    );
  }

  TextStyle buildTextStyleDoctorName() {
    return TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 18,
    );
  }
}
