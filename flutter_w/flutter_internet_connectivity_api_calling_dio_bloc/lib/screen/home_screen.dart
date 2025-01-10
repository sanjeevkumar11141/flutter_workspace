import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/api_bloc.dart';


class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final apiBloc = context.read<ApiBloc>();

    return Scaffold(
      appBar: AppBar(
        title: Text('Posts'),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              // Fetch posts from the API
              apiBloc.add(FetchPostsEvent());
            },
            child: Text('Fetch Posts'),
          ),
          Expanded(
            child: BlocBuilder<ApiBloc, ApiState>(
              builder: (context, state) {
                if (state is ApiLoadingState) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is ApiSuccessState) {
                  return ListView.builder(
                    itemCount: state.data.length,
                    itemBuilder: (context, index) {
                      final post = state.data[index];
                      return ListTile(
                        title: Text(post['title']),
                        subtitle: Text(post['body']),
                      );
                    },
                  );
                } else if (state is ApiErrorState) {
                  return Center(
                    child: Text(
                      state.message,
                      style: TextStyle(color: Colors.red),
                    ),
                  );
                }
                return Container();
              },
            ),
          ),
        ],
      ),
    );
  }
}
