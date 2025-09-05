import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:professional_application/components/empty_requests_component.dart';
import 'package:professional_application/components/request_card_component.dart';
import 'package:professional_application/providers/requests_provider.dart';

class RequestsScreen extends StatelessWidget {
  const RequestsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<RequestsProvider>(
      builder: (context, requestsProvider, child) {
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(2),
            child: Column(
              children: [
                // زر التفعيل والنص
                Container(
                  padding: const EdgeInsets.all(5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Switch(
                            value: requestsProvider.requestsEnabled,
                            onChanged: (value) {
                              requestsProvider.toggleRequests();
                            },
                            activeColor: const Color.fromARGB(30, 58, 138, 1),
                            activeTrackColor:
                                const Color.fromARGB(255, 11, 73, 135),
                          ),
                          const SizedBox(width: 18),
                          const Text(
                            'متاح لتلقي طلبات',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),

                // رسالة عند عدم التفعيل
                if (!requestsProvider.requestsEnabled)
                  Container(
                    padding: const EdgeInsets.all(16),
                    margin: const EdgeInsets.only(bottom: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: const Color.fromARGB(255, 187, 18, 18),
                        width: 1,
                      ),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.event_note_sharp),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            "أنت غير متاح حاليًا لتلقي الطلبات الجديدة. قم بتفعيل الزر أعلاه لبدء استقبال الطلبات.",
                            style: const TextStyle(
                              fontSize: 14,
                              color: Color.fromARGB(255, 88, 85, 83),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                // محتوى الطلبات
                Expanded(
                  child: requestsProvider.requestsEnabled
                      ? (requestsProvider.hasRequests
                          ? ListView.builder(
                              itemCount: requestsProvider.requests.length,
                              itemBuilder: (context, index) {
                                final request =
                                    requestsProvider.requests[index];
                                return RequestCardComponent(
                                  name: request['name'],
                                  address: request['address'],
                                  time: request['time'],
                                  price: request['price'] ?? '\$0',
                                  userImage: request['userImage'] ??
                                      "assets/images/persion.png",
                                  onAccept: () =>
                                      requestsProvider.acceptRequest(index),
                                  onReject: () =>
                                      requestsProvider.rejectRequest(index),
                                );
                              },
                            )
                          : const EmptyRequestsComponent())
                      : Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // استبدال الأيقونة بـ SVG
                              SvgPicture.asset(
                                "assets/svg/audit1.svg",
                                height: 150,
                                width: 150,
                                color: Colors.grey[300],
                              ),
                              const SizedBox(height: 16),
                              const Text(
                                "لا توجد طلبات حاليا",
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                ),
                              ),
                              const SizedBox(height: 8),
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 40),
                                child: Text(
                                  "أنت غير متاح حاليًا لتلقي الطلبات. قم بتفعيل الزر لبدء استقبال الطلبات الجديدة.",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
