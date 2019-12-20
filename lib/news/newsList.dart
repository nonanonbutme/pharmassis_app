import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/widgets.dart';
import 'newsArticle.dart';
import 'webservice.dart';
import 'constants.dart';

class NewsListState extends State<NewsList> {
  List<NewsArticle> _newsArticles = List<NewsArticle>();

  @override
  void initState() {
    super.initState();
    _populateNewsArticles();
  }

  void _populateNewsArticles() {
    Webservice().load(NewsArticle.all).then((newsArticles) => {
          setState(() => {_newsArticles = newsArticles})
        });
  }

  ListTile _buildItemsForListView(BuildContext context, int index) {
    return ListTile(
      title: _newsArticles[index].urlToImage == null
          ? Image.asset(Constants.NEWS_PLACEHOLDER_IMAGE_ASSET_URL)
          : Image.network(_newsArticles[index].urlToImage),
      subtitle:
          Text(_newsArticles[index].title, style: TextStyle(fontSize: 18)),
      onTap: () => _launchURL(index),

    );
  }

  _launchURL(index) async {
    var url = _newsArticles[index].url;
    if (await canLaunch(url)) {
      await launch(url, forceWebView: true); //forceWebView
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        /*appBar: AppBar(
          title: Text('News'),
        ),*/
        body: ListView.builder(
      itemCount: _newsArticles.length,
      itemBuilder: _buildItemsForListView,

    ));
  }
}

class NewsList extends StatefulWidget {
  @override
  createState() => NewsListState();
}
