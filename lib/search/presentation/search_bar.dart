import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gooddhan/search/shared/providers.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'dart:io';

class SearchBar extends ConsumerStatefulWidget {
  final Widget body;
  final String title;
  final String hint;
  final Widget filter;
  final void Function(String searchTerm) onShouldNavigateToResultPage;

  const SearchBar({
    Key? key,
    required this.body,
    required this.title,
    required this.hint,
    required this.filter,
    required this.onShouldNavigateToResultPage,
  }) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SearchBarState();
}

class _SearchBarState extends ConsumerState<SearchBar> {
  late FloatingSearchBarController _controller;
  @override
  void initState() {
    _controller = FloatingSearchBarController();
    ref.read(searchHistoryRepositoryProvider).watchSearchTerm();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    void pushPageAndPutFirstInHistory(String searchTerm) {
      widget.onShouldNavigateToResultPage(searchTerm);
      ref
          .read(searchHistoryNotifierProvider.notifier)
          .putSearchTermFirst(searchTerm);
      _controller.close();
    }

    void pushPageAndAddToHistory(String searchTerm) {
      widget.onShouldNavigateToResultPage(searchTerm);
      ref
          .read(searchHistoryNotifierProvider.notifier)
          .addSearchTerm(searchTerm);
      _controller.close();
    }

    return SafeArea(
      child: FloatingSearchBar(
        controller: _controller,
        body: FloatingSearchBarScrollNotifier(child: widget.body),
        hint: widget.hint,
        elevation: 1,
        // automaticallyImplyBackButton: false,
        actions: [
          FloatingSearchBarAction.searchToClear(
            showIfClosed: false,
          ),
          FloatingSearchBarAction(child: widget.filter)
        ],
        onSubmitted: (query) {
          pushPageAndAddToHistory(query);
        },
        onQueryChanged: (query) {
          ref
              .read(
                searchHistoryNotifierProvider.notifier,
              )
              .watchSearchTerms(filter: query);
        },
        builder: (BuildContext context, Animation<double> transition) {
          return Material(
            color: Theme.of(context).cardColor,
            elevation: 4,
            borderRadius: BorderRadius.circular(4),
            clipBehavior: Clip.hardEdge,
            child: Consumer(
              builder: (context, ref, child) {
                final searchHistoryState =
                    ref.watch(searchHistoryNotifierProvider);
                return searchHistoryState.map(
                  data: (history) {
                    if (_controller.query.isEmpty && history.value.isEmpty) {
                      return Container(
                        height: 56,
                        alignment: Alignment.center,
                        child: Text(
                          'Start searching',
                          style: Theme.of(context).textTheme.caption,
                        ),
                      );
                    } else if (history.value.isEmpty) {
                      return ListTile(
                        title: Text(_controller.query),
                        leading: const Icon(Icons.search),
                        onTap: () {
                          pushPageAndAddToHistory(_controller.query);
                        },
                      );
                    }
                    return Column(
                      children: history.value
                          .map(
                            (term) => ListTile(
                              title: Text(
                                term,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              leading: const Icon(Icons.history),
                              trailing: IconButton(
                                icon: const Icon(Icons.clear),
                                onPressed: () {
                                  ref
                                      .read(searchHistoryNotifierProvider
                                          .notifier)
                                      .deleteSearchTerm(term);
                                },
                              ),
                              onTap: () {
                                pushPageAndPutFirstInHistory(term);
                              },
                            ),
                          )
                          .toList(),
                    );
                  },
                  loading: (_) => const ListTile(
                    title: Text("🔍 Type something to search..."),
                  ),
                  error: (_) => ListTile(
                    title: Text('Very unexpected error ${_.error}'),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
