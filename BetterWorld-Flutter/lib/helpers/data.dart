import 'package:flutter/material.dart';

List<Map> categories = [
  {'name': 'Pay Bills', 'icon': Icons.receipt, 'route': '/bill'},
  {'name': 'Complaints', 'icon': Icons.warning, 'route': '/complaints'},
  {'name': 'View Usage', 'icon': Icons.assignment, 'route': '/usage'},
  {'name': 'Bored?', 'icon': Icons.videogame_asset, 'route': '/game'},
  // {
  //   'name': 'Support',
  //   'icon': Icons.email,
  //   'tap': () => {print('Contact Us')}
  // },
];

List complaintCategories = [
   'Power Outrage',
   'Critical Failure',
   'Incorrect Readings'
];

List<Map> billingHistory = [
  {
    'amount': 8973,
    'date': '19 Jan 2020',
    'method': 'UPI',
    'id': 'EJi6RISuyefSo57UD93P'
  },
  {
    'amount': 6295,
    'date': '2 Mar 2020',
    'method': 'Debit Card',
    'id': 'ujsdq2UcBvD5TVJUC1LZ'
  },
  {
    'amount': 4507,
    'date': '27 Apr 2020',
    'method': 'Netbanking',
    'id': 'bY2MxY6ul8yfqolqCyJ6'
  },
  {
    'amount': 11207,
    'date': '16 May 2020',
    'method': 'Paytm Wallet',
    'id': 'mXBtjp9M0Zrla2SvxvaV'
  },
  {
    'amount': 43157,
    'date': '28 Jun 2020',
    'method': 'Paytm Wallet',
    'id': 'i6mqACgrJFBUCh2imftU'
  },
];
