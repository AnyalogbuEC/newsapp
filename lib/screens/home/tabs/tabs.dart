import 'package:flutter/material.dart';
import 'package:news_app/screens/home/blog_tile.dart';

/// This file contains ListView widgets for the respective tab
/// in the home screen of the app
///

// ListView  widget for the all news tab
ListView newsTab(articles) {
  return ListView.builder(
      itemCount: articles.length,
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        return BlogTile(
          description: articles[index].description,
          imageUrl: articles[index].urlToImage,
          title: articles[index].title,
        );
      });
}

// // ListView  widget for the business news tab
// ListView businessNewsTab(articles) {
//   return ListView.builder(
//       itemCount: articles.length,
//       shrinkWrap: true,
//       itemBuilder: (context, index) {
//         return BlogTile(
//           description: articles[index].description,
//           imageUrl: articles[index].urlToImage,
//           title: articles[index].title,
//         );
//       });
// }

// // ListView  widget for the entertainment news tab
// ListView entertainmentNewsTab(articles) {
//   return ListView.builder(
//       itemCount: articles.length,
//       shrinkWrap: true,
//       itemBuilder: (context, index) {
//         return BlogTile(
//           description: articles[index].description,
//           imageUrl: articles[index].urlToImage,
//           title: articles[index].title,
//         );
//       });
// }

// // ListView  widget for the health news tab
// ListView healthNewsTab(articles) {
//   return ListView.builder(
//       itemCount: articles.length,
//       shrinkWrap: true,
//       itemBuilder: (context, index) {
//         return BlogTile(
//           description: articles[index].description,
//           imageUrl: articles[index].urlToImage,
//           title: articles[index].title,
//         );
//       });
// }

// // ListView  widget for the science news tab
// ListView scienceNewsTab(articles) {
//   return ListView.builder(
//       itemCount: articles.length,
//       shrinkWrap: true,
//       itemBuilder: (context, index) {
//         return BlogTile(
//           description: articles[index].description,
//           imageUrl: articles[index].urlToImage,
//           title: articles[index].title,
//         );
//       });
// }

// // ListView  widget for the technology news tab
// ListView technologyNewsTab(articles) {
//   return ListView.builder(
//       itemCount: articles.length,
//       shrinkWrap: true,
//       itemBuilder: (context, index) {
//         return BlogTile(
//           description: articles[index].description,
//           imageUrl: articles[index].urlToImage,
//           title: articles[index].title,
//         );
//       });
// }

// // ListView  widget for sports news tab
// ListView sportsNewsTab(articles) {
//   return ListView.builder(
//       itemCount: articles.length,
//       shrinkWrap: true,
//       itemBuilder: (context, index) {
//         return BlogTile(
//           description: articles[index].description,
//           imageUrl: articles[index].urlToImage,
//           title: articles[index].title,
//         );
//       });
// }
