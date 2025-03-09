// lib/screens/dashboard_screen.dart
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/theme_provider.dart';
import 'package:provider/provider.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDarkMode = themeProvider.isDarkMode;

    return Scaffold(
      appBar: AppBar(
        title: Text("Business Dashboard",
            style:
                GoogleFonts.poppins(fontSize: 22, fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            icon: Icon(isDarkMode ? Icons.light_mode : Icons.dark_mode),
            onPressed: () => themeProvider.toggleTheme(),
          ),
        ],
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator()) // Fun Loader
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Business Performance",
                        style: GoogleFonts.poppins(
                            fontSize: 24, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 20),

                    // Quick Stats Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildStatCard("Total Revenue", "R 500K", Colors.blue),
                        _buildStatCard("Active Clients", "120", Colors.green),
                      ],
                    ),
                    const SizedBox(height: 20),

                    // Line Graph
                    Text("Monthly Growth",
                        style: GoogleFonts.poppins(
                            fontSize: 18, fontWeight: FontWeight.w600)),
                    SizedBox(
                      height: 200,
                      child: LineChart(
                        LineChartData(
                          gridData: const FlGridData(show: false),
                          titlesData: const FlTitlesData(show: false),
                          borderData: FlBorderData(show: false),
                          lineBarsData: [
                            LineChartBarData(
                              spots: [
                                const FlSpot(1, 10),
                                const FlSpot(2, 30),
                                const FlSpot(3, 20),
                                const FlSpot(4, 50),
                                const FlSpot(5, 40),
                              ],
                              isCurved: true,
                              color: Colors.blueAccent,
                              barWidth: 4,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),

                    // Bar Graph
                    Text("Company Revenue Comparison",
                        style: GoogleFonts.poppins(
                            fontSize: 18, fontWeight: FontWeight.w600)),
                    SizedBox(
                      height: 200,
                      child: BarChart(
                        BarChartData(
                          alignment: BarChartAlignment.spaceAround,
                          barGroups: [
                            BarChartGroupData(x: 1, barRods: [
                              BarChartRodData(toY: 50, color: Colors.blue)
                            ]),
                            BarChartGroupData(x: 2, barRods: [
                              BarChartRodData(toY: 80, color: Colors.green)
                            ]),
                            BarChartGroupData(x: 3, barRods: [
                              BarChartRodData(toY: 30, color: Colors.red)
                            ]),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),

                    // Pie Chart
                    Text("Revenue Distribution",
                        style: GoogleFonts.poppins(
                            fontSize: 18, fontWeight: FontWeight.w600)),
                    SizedBox(
                      height: 200,
                      child: PieChart(
                        PieChartData(
                          sections: [
                            PieChartSectionData(
                                value: 40,
                                color: Colors.blue,
                                title: 'Records'),
                            PieChartSectionData(
                                value: 35,
                                color: Colors.green,
                                title: 'Connect'),
                            PieChartSectionData(
                                value: 25, color: Colors.red, title: 'Living'),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

      // Modern Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.dashboard), label: "Dashboard"),
          BottomNavigationBarItem(
              icon: Icon(Icons.analytics), label: "Reports"),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: "Settings"),
        ],
      ),
    );
  }

  Widget _buildStatCard(String title, String value, Color color) {
    return Container(
      width: 150,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
              color: color.withOpacity(0.4),
              blurRadius: 10,
              offset: const Offset(3, 3)),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(value,
              style: GoogleFonts.poppins(
                  fontSize: 22, fontWeight: FontWeight.bold, color: color)),
          const SizedBox(height: 8),
          Text(title,
              style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87)),
        ],
      ),
    );
  }
}
