import 'package:client/models/employee_model.dart';
import 'package:client/screens/groupTwo/admin_dashboard_screen.dart';
import 'package:client/screens/groupTwo/department_crud_screen.dart';
import 'package:client/screens/groupTwo/edit_admin_employee_screen.dart';
import 'package:client/screens/groupTwo/edit_personal_screen.dart';
import 'package:client/screens/groupTwo/employee_detail_screen.dart';
import 'package:client/screens/groupTwo/employee_list_screen.dart';
import 'package:client/screens/groupTwo/position_crud_screen.dart';
import 'package:client/screens/groupTwo/role_selection_screen.dart';
import 'package:client/widgets/navbar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'screens/home_screen.dart';
import 'screens/login_screen.dart';

final GoRouter router = GoRouter(
  initialLocation: "/role-selection",
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return Scaffold(
          body: navigationShell,
          bottomNavigationBar: Navbar(navigationShell: navigationShell),
        );
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: "/home",
              builder: (context, state) => const HomeScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: "/profile",
              builder: (context, state) => const HomeScreen(),
            ),
          ],
        ),
      ],
    ),

    // Non-nav pages (full screen)
    GoRoute(path: "/login", builder: (context, state) => const LoginScreen()),

    // ========================================
    // GROUP TWO ROUTES
    // ========================================

    // Role selection screen
    GoRoute(
      path: "/role-selection",
      builder: (context, state) => const RoleSelectionScreen(),
    ),

    // ========== KARYAWAN MODE ==========

    // Employee list (Karyawan mode)
    GoRoute(
      path: "/employee-list",
      builder: (context, state) =>
          const EmployeeListScreen(isKaryawanMode: true),
    ),

    // Employee detail
    GoRoute(
      path: "/employee-detail/:id",
      builder: (context, state) {
        final extra = state.extra as Map<String, dynamic>?;

        if (extra == null) {
          return const Scaffold(
            body: Center(child: Text('Error: Data karyawan tidak ditemukan')),
          );
        }

        final employee = extra['employee'] as EmployeeModel;
        final isKaryawanMode = extra['isKaryawanMode'] as bool;

        return EmployeeDetailScreen(
          initialEmployee: employee, // UBAH NAMA PARAMETER
          isKaryawanMode: isKaryawanMode,
        );
      },
    ),

    // Edit personal info (Karyawan mode)
    GoRoute(
      path: "/employee/edit-personal/:id",
      builder: (context, state) {
        final employee = state.extra as EmployeeModel?;

        if (employee == null) {
          return const Scaffold(
            body: Center(child: Text('Error: Data karyawan tidak ditemukan')),
          );
        }

        return EditPersonalScreen(employee: employee);
      },
    ),

    // ========== ADMIN MODE ==========

    // Admin dashboard
    GoRoute(
      path: "/admin-dashboard",
      builder: (context, state) => const AdminDashboardScreen(),
    ),

    // Admin - Employee list for management
    GoRoute(
      path: "/admin/employee-list",
      builder: (context, state) =>
          const EmployeeListScreen(isKaryawanMode: false),
    ),

    // Admin - Edit management
    GoRoute(
      path: "/employee/edit-management/:id",
      builder: (context, state) {
        final employee = state.extra as EmployeeModel?;

        if (employee == null) {
          return const Scaffold(
            body: Center(child: Text('Error: Data karyawan tidak ditemukan')),
          );
        }

        return EditAdminEmployeeScreen(employee: employee);
      },
    ),

    // Admin - Position CRUD
    GoRoute(
      path: "/admin/positions",
      builder: (context, state) => const PositionCrudScreen(),
    ),

    // Admin - Department CRUD
    GoRoute(
      path: "/admin/departments",
      builder: (context, state) => const DepartmentCrudScreen(),
    ),
  ],
);
