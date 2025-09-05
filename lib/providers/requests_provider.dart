import 'package:flutter/material.dart';

class RequestsProvider with ChangeNotifier {
  List<Map<String, dynamic>> _requests = [];
  bool _requestsEnabled = true;

  List<Map<String, dynamic>> get requests => _requests;
  bool get hasRequests => _requests.isNotEmpty;
  bool get requestsEnabled => _requestsEnabled;

  void addRequest(Map<String, dynamic> request) {
    if (_requestsEnabled) {
      _requests.add(request);
      notifyListeners();
    }
  }

  void acceptRequest(int index) {
    if (index >= 0 && index < _requests.length) {
      _requests.removeAt(index);
      notifyListeners();
    }
  }

  void rejectRequest(int index) {
    if (index >= 0 && index < _requests.length) {
      _requests.removeAt(index);
      notifyListeners();
    }
  }

  void clearAllRequests() {
    _requests.clear();
    notifyListeners();
  }

  void toggleRequests() {
    _requestsEnabled = !_requestsEnabled;
    
    if (_requestsEnabled && _requests.isEmpty) {
      _loadSampleRequests();
    }
    
    notifyListeners();
  }

  void _loadSampleRequests() {
    _requests = [
      {
        'id': 1,
        'name': 'زيد الصالح',
        'address': 'سوريا - حلب - اعزاز - دوار الصنم',
        'time': 'منذ 5 دقائق',
        'status': 'pending',
        'userImage': 'assets/images/persion.png',
        'price': '\$25', // تأكد من وجود السعر
      },
      {
        'id': 2,
        'name': 'مجد عبدالحي',
        'address': 'سوريا - دمشق - الميدان - شارع الثورة',
        'time': 'منذ 15 دقيقة',
        'status': 'pending',
        'userImage': 'assets/images/persion.png',
        'price': '\$18', // تأكد من وجود السعر
      },
      {
        'id': 3,
        'name': 'عبدالرزاق الصالح',
        'address': 'سوريا - اللاذقية - وسط المدينة - ساحة الشهداء',
        'time': 'منذ 30 دقيقة',
        'status': 'pending',
        'userImage': 'assets/images/persion.png',
        'price': '\$32', // تأكد من وجود السعر
      },
      {
        'id': 4,
        'name': 'محمد العلي',
        'address': 'حلب - اعزاز - سجو - جانب الكراج',
        'time': 'منذ 45 دقيقة',
        'status': 'pending',
        'userImage': 'assets/images/persion.png',
        'price': '\$50', // تأكد من وجود السعر
      },
    ];
  }

  void loadSampleRequests() {
    if (_requestsEnabled) {
      _loadSampleRequests();
      notifyListeners();
    }
  }
}