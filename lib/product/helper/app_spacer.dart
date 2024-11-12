import 'package:flutter/material.dart';

final class AppSpacer extends SizedBox {
//Vertical Space
  const AppSpacer.vertical5({super.key}) : super(height: 5);
  const AppSpacer.vertical10({super.key}) : super(height: 10);
  const AppSpacer.vertical15({super.key}) : super(height: 15);
  const AppSpacer.vertical20({super.key}) : super(height: 20);
  const AppSpacer.vertical25({super.key}) : super(height: 25);
  const AppSpacer.vertical30({super.key}) : super(height: 30);
  const AppSpacer.vertical50({super.key}) : super(height: 50);

//Horizontal Space
  const AppSpacer.horizontal5({super.key}) : super(width: 5);
  const AppSpacer.horizontal10({super.key}) : super(width: 10);
  const AppSpacer.horizontal15({super.key}) : super(width: 15);
  const AppSpacer.horizontal20({super.key}) : super(width: 20);
  const AppSpacer.horizontal25({super.key}) : super(width: 25);
  const AppSpacer.horizontal30({super.key}) : super(width: 30);
}
