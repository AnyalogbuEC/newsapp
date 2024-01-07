import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/screens/home/tabs/tabs.dart';
import 'package:news_app/utilities/constants.dart';
import 'package:news_app/utilities/news.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  /// listing the functions that will execute as the app is initializing
  ///
  /// calling the getAppTheme method which gets and sets the theme from shared preferences
  ///
  /// calling the getNewsArticle function which get the news articles from newsapi.org

  @override
  void initState() {
    super.initState();
    getAppTheme();
    getAllNews("general");
    getBusinessNews("business");
    getEntertainmentNews("entertainment");
    getHealthNews("health");
    getScienceNews("science");
    getTechnologyNews("technology");
    getSportsNews("sports");
  }

  bool isDarkTheme = false; // setting the default app theme to light.
  bool loadingAll = true;
  bool loadingBusiness = true;
  bool loadingEntertainment = true;
  bool loadingHealth = true;
  bool loadingScience = true;
  bool loadingTechnology = true;
  bool loadingSports = true;

  String country = "us";
  String keyWord = "";

// creating list of  articles of the type ArticleModel
  List<ArticleModel> allTabArticles = <ArticleModel>[];
  List<ArticleModel> businessTabArticles = <ArticleModel>[];
  List<ArticleModel> entertainmentTabArticles = <ArticleModel>[];
  List<ArticleModel> healthTabArticles = <ArticleModel>[];
  List<ArticleModel> scienceTabArticles = <ArticleModel>[];
  List<ArticleModel> technologyTabArticles = <ArticleModel>[];
  List<ArticleModel> sportsTabArticles = <ArticleModel>[];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 7, // this is the number of tabs that is shown in the app.
      child: Scaffold(
        backgroundColor: isDarkTheme ? dBackground : lBackground,

        //calling the appBarBuild which return an AppBar
        appBar: appBarBuild(),

        // building the body section of the home page
        body: TabBarView(children: [
          loadingAll
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : allTabArticles.isEmpty
                  ? GestureDetector(
                      onTap: () => getAllNews("general"),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.replay_outlined),
                          Text("Ooops, can't get the news!"),
                        ],
                      ),
                    )
                  : TabBuilder(tabArticles: allTabArticles),
          loadingBusiness
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : businessTabArticles.isEmpty
                  ? GestureDetector(
                      onTap: () => getBusinessNews("business"),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.replay_outlined),
                          Text("Ooops, can't get the news!"),
                        ],
                      ),
                    )
                  : TabBuilder(tabArticles: businessTabArticles),
          loadingEntertainment
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : entertainmentTabArticles.isEmpty
                  ? GestureDetector(
                      onTap: () => getEntertainmentNews("entertainment"),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.replay_outlined),
                          Text("Ooops, can't get the news!"),
                        ],
                      ),
                    )
                  : TabBuilder(tabArticles: entertainmentTabArticles),
          loadingHealth
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : healthTabArticles.isEmpty
                  ? GestureDetector(
                      onTap: () => getHealthNews("health"),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.replay_outlined),
                          Text("Ooops, can't get the news!"),
                        ],
                      ),
                    )
                  : TabBuilder(tabArticles: healthTabArticles),
          loadingScience
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : scienceTabArticles.isEmpty
                  ? GestureDetector(
                      onTap: () => getScienceNews("science"),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.replay_outlined),
                          Text("Ooops, can't get the news!"),
                        ],
                      ),
                    )
                  : TabBuilder(tabArticles: scienceTabArticles),
          loadingTechnology
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : technologyTabArticles.isEmpty
                  ? GestureDetector(
                      onTap: () => getTechnologyNews("technology"),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.replay_outlined),
                          Text("Ooops, can't get the news!"),
                        ],
                      ),
                    )
                  : TabBuilder(tabArticles: technologyTabArticles),
          loadingSports
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : sportsTabArticles.isEmpty
                  ? GestureDetector(
                      onTap: () => getSportsNews("sports"),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.replay_outlined),
                          Text("Ooops, can't get the news!"),
                        ],
                      ),
                    )
                  : TabBuilder(tabArticles: sportsTabArticles),
          //       ],
          //     ),
          //   ),
          // ),
        ]),
      ),
    );
  }

// method that gets the articles, it is invoked  as the app initializes
  Future<bool> getNews(
      String newsCategory, List<ArticleModel> tabArticles) async {
    News newsObject = News(
      country: country,
      category: newsCategory,
      keyWord: keyWord,
    );
    await newsObject.getNews();
    tabArticles = newsObject.news;
    // setState(() {
    return false;
    // });
  }

  getAllNews(String newsCategory) async {
    News newsObject = News(
      country: country,
      category: newsCategory,
      keyWord: keyWord,
    );
    await newsObject.getNews();
    allTabArticles = newsObject.news;
    // if (allTabArticles.isNotEmpty) {
    setState(() {
      loadingAll = false;
    });
    // }
  }

  getBusinessNews(String newsCategory) async {
    News newsObject = News(
      country: country,
      category: newsCategory,
      keyWord: keyWord,
    );
    await newsObject.getNews();
    businessTabArticles = newsObject.news;
    setState(() {
      loadingBusiness = false;
    });
  }

  getEntertainmentNews(String newsCategory) async {
    News newsObject = News(
      country: country,
      category: newsCategory,
      keyWord: keyWord,
    );
    await newsObject.getNews();
    entertainmentTabArticles = newsObject.news;
    setState(() {
      loadingEntertainment = false;
    });
  }

  getHealthNews(String newsCategory) async {
    News newsObject = News(
      country: country,
      category: newsCategory,
      keyWord: keyWord,
    );
    await newsObject.getNews();
    healthTabArticles = newsObject.news;
    setState(() {
      loadingHealth = false;
    });
  }

  getScienceNews(String newsCategory) async {
    News newsObject = News(
      country: country,
      category: newsCategory,
      keyWord: keyWord,
    );
    await newsObject.getNews();
    scienceTabArticles = newsObject.news;
    setState(() {
      loadingScience = false;
    });
  }

  getTechnologyNews(String newsCategory) async {
    News newsObject = News(
      country: country,
      category: newsCategory,
      keyWord: keyWord,
    );
    await newsObject.getNews();
    technologyTabArticles = newsObject.news;
    setState(() {
      loadingTechnology = false;
    });
  }

  getSportsNews(String newsCategory) async {
    News newsObject = News(
      country: country,
      category: newsCategory,
      keyWord: keyWord,
    );
    await newsObject.getNews();
    sportsTabArticles = newsObject.news;
    setState(() {
      loadingSports = false;
    });
  }

// method setting the app theme
  setAppTheme(bool isDarkTheme) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isDarkTheme', isDarkTheme);
    setState(() {
      this.isDarkTheme = isDarkTheme;
    });
  }

// method getting the app theme
  getAppTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      isDarkTheme = prefs.getBool('isDarkTheme') ?? false;
    });
  }

// creating the appBarBuild widget of type AppBar which returns the app bar.
  AppBar appBarBuild() {
    return AppBar(
      title: const Text("NewsApp"),
      backgroundColor: isDarkTheme ? dAppBarBackground : lAppBarBackground,
      centerTitle: true,
      elevation: 0.0,
      actions: [
        IconButton(
          onPressed: () {
            setState(
              () {
                setAppTheme(!isDarkTheme);
              },
            );
          },
          tooltip: "Change theme",
          icon: Icon(
            isDarkTheme ? Icons.light_mode : Icons.dark_mode,
            color: Colors.white,
          ),
        ),
        IconButton(
          onPressed: () {},
          tooltip: "More",
          icon: const Icon(
            Icons.settings_outlined,
            color: Colors.white,
          ),
        ),
      ],
      bottom: const TabBar(
        isScrollable: true,
        indicatorColor: Colors.white70,
        indicatorWeight: 2.3,
        tabs: [
          Tab(text: "All"),
          Tab(text: "Business"),
          Tab(text: "Entertainment"),
          Tab(text: "Health"),
          Tab(text: "Science"),
          Tab(text: "Technology"),
          Tab(text: "Sports"),
        ],
      ),
    );
  }
}

class TabBuilder extends StatelessWidget {
  const TabBuilder({
    Key? key,
    required this.tabArticles,
  }) : super(key: key);

  final List<ArticleModel> tabArticles;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            Text(MediaQuery.of(context).size.width.toString()),
            SizedBox(
              width: MediaQuery.of(context).size.width >= 600
                  ? 600
                  : double.infinity,
              child: newsTab(tabArticles),
            ),
          ],
        ),
      ),
    );
  }
}
