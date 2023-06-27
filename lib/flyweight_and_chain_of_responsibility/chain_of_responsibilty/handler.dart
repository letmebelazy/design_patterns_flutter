abstract class Handler {
  Handler? next;

  Handler(this.next);

  String gitActivity(int commitCount);

  String execute(int commitCount) {
    String result = gitActivity(commitCount);
    if (next != null) {
      result += '\n' + next!.execute(commitCount);
    }
    return result;
  }
}
