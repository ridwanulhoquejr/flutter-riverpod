import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_tutorial/model/suggestion.dart';

final apiServiceProvider = Provider<ApiService>((ref) => ApiService());

class ApiService {
  Future<Suggestion> getSuggestion() async {
    try {
      final response = await Dio().get('https://www.boredapi.com/api/activity');
      return Suggestion.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to load suggestion');
    }
  }
}
