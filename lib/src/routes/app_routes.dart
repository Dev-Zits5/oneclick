part of 'app_pages.dart';

abstract class Routes {
  static const login = Paths.login; 
  
  static const home = Paths.home; 
  
  static const dashboard = Paths.home + Paths.dashboard; 
  static const units = Paths.home + Paths.units;
  static const menus = Paths.home + Paths.menus;
  static const additions = Paths.home + Paths.additions; 
  static const sections = Paths.home + Paths.sections;
  static const items = Paths.home + Paths.items;
  static const groups = Paths.home + Paths.groups; 
  
  // (سنضيف باقي المسارات هنا)
}


abstract class Paths {
  static const login = '/login';
  static const home = '/home'; 
  
  static const dashboard = '/dashboard';
  static const units = '/units';
  static const menus = '/menus';
  static const additions = '/additions';
  static const sections = '/sections';
  static const items = '/items';
  static const groups = '/groups';
}