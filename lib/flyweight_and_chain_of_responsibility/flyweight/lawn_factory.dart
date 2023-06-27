import 'package:design_patterns_flutter/flyweight_and_chain_of_responsibility/flyweight/lawn.dart';
import 'package:design_patterns_flutter/flyweight_and_chain_of_responsibility/flyweight/lawn_with_more_than_four_commits.dart';
import 'package:design_patterns_flutter/flyweight_and_chain_of_responsibility/flyweight/lawn_with_no_commit.dart';
import 'package:design_patterns_flutter/flyweight_and_chain_of_responsibility/flyweight/lawn_with_one_commit.dart';
import 'package:design_patterns_flutter/flyweight_and_chain_of_responsibility/flyweight/lawn_with_three_commits.dart';
import 'package:design_patterns_flutter/flyweight_and_chain_of_responsibility/flyweight/lawn_with_two_commits.dart';

class LawnFactory {
  List<Lawn> lawns = [];

  Lawn getLawn(int commitCount) {
    final index = lawns.indexWhere((e) => e.commitCount == commitCount);

    if (index == -1) {
      switch (commitCount) {
        case 0:
          {
            final lawn = LawnWithNoCommit();
            lawns.add(lawn);
            return lawn;
          }
        case 1:
          {
            final lawn = LawnWithOneCommit();
            lawns.add(lawn);
            return lawn;
          }
        case 2:
          {
            final lawn = LawnWithTwoCommits();
            lawns.add(lawn);
            return lawn;
          }
        case 3:
          {
            final lawn = LawnWithThreeCommits();
            lawns.add(lawn);
            return lawn;
          }
        default:
          {
            final lawn = LawnWithMoreThanFourCommits();
            lawns.add(lawn);
            return lawn;
          }
      }
    } else {
      return lawns[index];
    }
  }
}
