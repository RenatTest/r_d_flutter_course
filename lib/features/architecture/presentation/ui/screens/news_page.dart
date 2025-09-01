import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:r_d_flutter_course/core/network/news_api/news_api.dart';
import 'package:r_d_flutter_course/features/architecture/presentation/cubit/news_cubit.dart';
import 'package:r_d_flutter_course/features/architecture/presentation/cubit/news_state.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News Page'),
        backgroundColor: Colors.blue.shade100,
      ),
      body: Center(
        child: BlocBuilder<NewsCubit, NewsState>(
          builder: (context, state) {
            return switch (state.status) {
              // Initial state
              NewsStatus.initial => const Center(
                child: Text('News Page', style: TextStyle(fontSize: 24)),
              ),

              // Loading state
              NewsStatus.loading => const Center(
                child: CircularProgressIndicator(),
              ),

              // Loaded state
              NewsStatus.loaded => ListView.builder(
                itemCount: state.news.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    margin: const EdgeInsets.all(10),
                    child: ListTile(
                      title: Text(state.news[index].titleUa),
                      subtitle: Text(state.news[index].contentShortUa),
                      leading: Image.network(
                        '$imageLink${state.news[index].img}',
                      ),
                      trailing: const Icon(Icons.arrow_forward_ios),
                    ),
                  );
                },
              ),

              // Error state
              NewsStatus.error => Center(
                child: Text(
                  state.errorMessage ?? 'Error',
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 24),
                ),
              ),
            };
          },
        ),
      ),
    );
  }
}
