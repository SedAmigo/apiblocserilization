import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:serelization/bloc/postbloc/post_bloc.dart';
import 'package:serelization/model/post_model/post.dart';
import 'package:serelization/screen/userUi.dart';

class UT extends StatefulWidget {
  @override
  _UTState createState() => _UTState();
}

class _UTState extends State<UT> {
  @override
  void initState() {
    BlocProvider.of<PostCubit>(context).getPost();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Api'),
        actions: [
          IconButton(
              icon: Icon(Icons.arrow_forward_ios),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UserUi(),
                  ),
                );
              })
        ],
      ),
      body: BlocBuilder<PostCubit, PostState>(
        builder: (context, postState) {
          if (postState is PostInitial) {
            return buildInitialWidget();
          } else if (postState is PostLoading) {
            return buildLoadingWidget();
          } else if (postState is PostLoaded) {
            return buildLoadedWidget(postState.posts);
          } else if (postState is PostError) {
            return buildErrorWidget(postState.errorMessage);
          } else {
            return null;
          }
        },
      ),
    );
  }

  Widget buildInitialWidget() {
    return Center(
        child: RaisedButton(onPressed: () {}, child: Text('Load Data')));
  }

  Widget buildLoadingWidget() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  var dividerWidget = Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: Divider(height: 1, thickness: 1, color: Colors.black38));

  Widget buildLoadedWidget(List<Post> posts) {
    return ListView.separated(
      physics: BouncingScrollPhysics(),
      separatorBuilder: (context, index) => dividerWidget,
      itemBuilder: (context, index) => _postItemWidget(context, posts[index]),
      itemCount: posts.length,
    );
  }

  Widget _postItemWidget(BuildContext context, Post post) {
    return Container(
      margin: EdgeInsets.only(left: 8.0, right: 8.0),
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0))),
        elevation: 4.0,
        child: InkWell(
          customBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(20.0),
            ),
          ),
          child: Container(
            margin: EdgeInsets.all(20.0),
            child: Column(children: [
              Text(post.id.toString()),
              Text(post.useId.toString()),
              Text(post.title),
              Text(post.body)
            ]),
          ),
        ),
      ),
    );
  }

  Widget buildErrorWidget(String message) {
    return Center(child: Text(message));
  }
}
