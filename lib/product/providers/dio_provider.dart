import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mdp2/product/service/api_service.dart';

final dioProvider = Provider<Dio>((ref) => ApiService().dio);
