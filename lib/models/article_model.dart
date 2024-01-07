/// This is a class, which is a model of the article been fetched from
/// newsapi.org
///
/// it has a constructor that initializes the required variables
///

class ArticleModel {
  String title, author, url, urlToImage, description, content;

  ArticleModel({
    required this.author,
    required this.content,
    required this.description,
    required this.title,
    required this.url,
    required this.urlToImage,
  });
}
