import 'package:flutter/material.dart';

void main() => runApp(const TotalGPAWidget());

class TotalGPAWidget extends StatelessWidget {
  const TotalGPAWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(color: Colors.grey, blurRadius: 7),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    children: [
                      Text(
                        'Total Grades',
                        style: TextStyle(
                          color: Colors.black45,
                          fontSize: 18,
                          fontFamily: 'Jost',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        '3.2 GPA',
                        style: TextStyle(
                          fontSize: 24,
                          fontFamily: 'Jost',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: const BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.circle,
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.download_rounded,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 6,),
              const Divider(),
              const SizedBox(
                height: 6,
              ),
              const Row(
                children: [
                  Column(
                    children: [
                      Row(
                        children: [Icon(Icons.folder_outlined),SizedBox(width: 4,), Text('Courses',style: TextStyle(fontFamily: 'Jost',fontSize:16,fontWeight: FontWeight.bold),)],
                      ), SizedBox(height: 4,),
                      Text('6',style: TextStyle(fontFamily: 'Jost',fontSize: 24,color: Colors.blueAccent),)
                    ],
                  ),
                  Spacer(),
                  Column(
                    children: [
                      Row(
                        children: [Icon(Icons.trending_up_outlined),SizedBox(width: 4,), Text('Total Scores',style: TextStyle(fontFamily: 'Jost',fontSize:16,fontWeight: FontWeight.bold),)],
                      ),SizedBox(height: 4,),
                      Text('1500',style: TextStyle(fontFamily: 'Jost',fontSize: 24,color: Colors.black87),)
                    ],
                  ),
                  Spacer(),
                  Column(
                    children: [
                      Row(
                        children: [Icon(Icons.person_2_outlined),SizedBox(width: 4,), Text('Your Score',style: TextStyle(fontFamily: 'Jost',fontSize:16,fontWeight: FontWeight.bold),)],
                      ),SizedBox(height: 4,),
                      Text('1420',style: TextStyle(fontFamily: 'Jost',fontSize: 24,color: Colors.blueAccent),)
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}