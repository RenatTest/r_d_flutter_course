import 'package:flutter/material.dart';

class RateAppSnackBarNoRating {
  SnackBar createSnackBar() {
    return SnackBar(
      content: Row(
        children: [
          Icon(Icons.star, color: Colors.white),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Оцінка не відправлена',
                  style: const TextStyle(fontSize: 16),
                ),
                Text(
                  'Оцініть будь-ласка програму перед відправкою',
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 3),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(6)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      dismissDirection: DismissDirection.none,
    );
  }
}
