// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, unused_field, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_advanced_segment/flutter_advanced_segment.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _selectedSegment_0 = AdvancedSegmentController('all');
  final _selectedSegment_1 = AdvancedSegmentController('all');
  final _selectedSegment_2 = AdvancedSegmentController('all');
  final _selectedSegment_3 = AdvancedSegmentController('all');
  final _selectedSegment_4 = AdvancedSegmentController('all');

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Advanced Segment Example'),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            vertical: 50,
          ),
          child: Center(
            child: Column(
              children: [
                _buildLabel('Black Style'),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(20),
                  color: Colors.black87,
                  child: Column(
                    children: [
                      Center(
                        child: AdvancedSegment(
                          controller: _selectedSegment_4,
                          segments: {
                            'all': 'All',
                            'missed': 'Missed',
                          },
                          backgroundColor: Colors.white10,
                          activeStyle: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                          inactiveStyle: TextStyle(
                            color: Colors.white,
                          ),
                          sliderColor: Colors.white38,
                        ),
                      ),
                      ValueListenableBuilder<String>(
                        valueListenable: _selectedSegment_4,
                        builder: (_, key, __) {
                          switch (key) {
                            case 'all':
                              return SizedBox(
                                height: 240,
                                child: Center(
                                  child: Text(
                                    'All calls',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              );
                            case 'missed':
                              return SizedBox(
                                height: 240,
                                child: Center(
                                  child: Text(
                                    'Missed calls',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              );
                            default:
                              return const SizedBox();
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLabel(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 25,
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: Text(
              label,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black45,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
