import 'package:flutter/cupertino.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'graphql/fragments.gql.dart';
import 'graphql/query.gql.dart';
import 'schema.graphqls.dart';
import 'package:api/api.dart';

extension AsInput on Avatar {
  Input$UploadingHsl? get asHslInput {
    if (!isColors) {
      return null;
    }

    return Input$UploadingHsl(hsl: value);
  }

  Input$UploadingFile? get asDataInput {
    if (!isData) {
      return null;
    }

    return Input$UploadingFile(
      filename: fileName,
      encoding: encoding,
      data: data,
      mimeType: mimeType!,
    );
  }
}

class PaginationOptions<O> {
  PaginationOptions({required this.operation, required this.fromJson});

  final QueryOptions operation;
  final O Function(Map<String, dynamic> object) fromJson;
}

// class PathMaterialsPaginationOptions
//     extends PaginationOptions<Fragment$Material> {
//   final String journeyId;
//   final String pathId;

//   PathMaterialsPaginationOptions(
//     this.journeyId,
//     this.pathId, [
//     Input$PaginationInput? pagination,
//   ]) : super(
//          operation: Options$Query$GetPathMaterials(
//            cacheRereadPolicy: CacheRereadPolicy.ignoreAll,
//            fetchPolicy: FetchPolicy.networkOnly,
//            variables: Variables$Query$GetPathMaterials(
//              journeyId: journeyId,
//              pathID: pathId,
//              pagination: pagination,
//            ),
//          ),
//          fromJson: (json) => Fragment$Material.fromJson(json),
//        );
// }

class JourneyDocsPaginationOptions extends PaginationOptions<Fragment$UserDoc> {
  JourneyDocsPaginationOptions(this.journeyId)
    : super(
        operation: Options$Query$GetJourneyDocs(
          cacheRereadPolicy: CacheRereadPolicy.ignoreAll,
          fetchPolicy: FetchPolicy.networkOnly,
          variables: Variables$Query$GetJourneyDocs(journeyId: journeyId),
        ),
        fromJson: (json) => Fragment$UserDoc.fromJson(json),
      );

  final String journeyId;
}

abstract class _Pagination<O> extends StatefulWidget {
  const _Pagination({
    super.key,
    required this.options,
    required this.itemBuilder,
    this.path,
    this.loadingBuilder,
    this.additionalWidgets,
  });

  final PaginationOptions<O> options;
  final Widget Function(O object) itemBuilder;
  final String? path;
  final Widget Function(BuildContext context)? loadingBuilder;

  final List<Widget>? additionalWidgets;

  @override
  _PaginationState<O, _Pagination<O>> createState();
}

abstract class _PaginationState<O, S extends _Pagination<O>> extends State<S> {
  late String? _path = widget.path;

  // find and object that has fields "items" and "pageInfo" and __typename includes possibleTypesMap
  String findPath(Map<String, dynamic> data) {
    final possibleConnections = {
      ...(possibleTypesMap["Connection"] as Set<String>),
      "AnyMaterialConnection",
    };

    String? p;
    dynamic current = data;
    String? currentKey;

    while (current != null && current is Map) {
      final type = current["__typename"];
      if (p == null) {
        p = currentKey;
      } else {
        p = "$p.$currentKey";
      }
      if (possibleConnections.contains(type)) {
        break;
      }

      currentKey = current.keys.toList().firstWhere((e) => e != "__typename");
      current = current[currentKey];
    }

    p ??= "";

    return p;
  }

  Map<String, dynamic> mergeArraysInPath(
    String path,
    Map<String, dynamic> oldData,
    Map<String, dynamic> newData,
  ) {
    final parts = path.split(".");

    dynamic currentNew = newData;
    dynamic currentOld = oldData;

    for (var part in parts) {
      currentNew = currentNew[part];
      currentOld = currentOld[part];
    }

    currentOld["items"] = [...currentOld["items"], ...currentNew["items"]];
    currentOld["pageInfo"] = currentNew["pageInfo"];

    return oldData;
  }

  Map<String, dynamic> object(Map<String, dynamic> data) {
    final path = _path;
    if (path == null || path.isEmpty) {
      throw Exception("No path found");
    }
    final parts = path.split(".");
    dynamic current = data;
    for (var part in parts) {
      current = current[part];
    }
    return current;
  }

  List items(Map<String, dynamic> data) {
    final obj = object(data);
    return obj["items"];
  }

  Fragment$PageInfo readPageInfo(Map<String, dynamic> data) {
    final obj = object(data);
    if (obj["pageInfo"] == null) {
      return Fragment$PageInfo(hasNextPage: false, nextCursor: null);
    }
    return Fragment$PageInfo.fromJson(obj["pageInfo"]);
  }

  bool gotFirstResult = false;

  bool get hasNextPage {
    if (_pageInfo == null) {
      return false;
    }
    return pageInfo.hasNextPage && pageInfo.nextCursor != null;
  }

  Fragment$PageInfo? _pageInfo;

  Fragment$PageInfo get pageInfo => _pageInfo!;

  bool _fetchingMore = false;

  Future<void> refetch() async {}

  @override
  Widget build(BuildContext context) {
    return Query(
      options: widget.options.operation,

      builder: (res, {Refetch? refetch, FetchMore? fetchMore}) {
        if (res.data != null) {
          if (!gotFirstResult) {
            _path ??= findPath(res.data!);
            gotFirstResult = true;
          }
          _pageInfo = readPageInfo(res.data!);
        }

        if (res.data == null && res.isLoading) {
          return widget.loadingBuilder?.call(context) ?? const SizedBox();
        }

        if (res.exception != null) {
          return Text(res.exception.toString());
        }

        final items = this.items(res.data!);

        final itemCount = this.itemCount(items.length);

        Widget itemBuilder(BuildContext context, int index) {
          if (index >= items.length) {
            if (index == itemCount - 1 && hasNextPage) {
              assert(hasNextPage);
              if (!_fetchingMore) {
                _fetchingMore = true;
                fetchMore
                    ?.call(
                      FetchMoreOptions(
                        updateQuery: (o, n) {
                          final res = mergeArraysInPath(_path!, o!, n!);
                          return res;
                        },
                        variables: {
                          "pagination": Input$PaginationInput.fromJson(
                            (widget.options.operation.variables["pagination"]
                                    as Map<String, dynamic>?) ??
                                {},
                          ).copyWith(cursor: pageInfo.nextCursor),
                        },
                      ),
                    )
                    .whenComplete(() {
                      _fetchingMore = false;
                    });
                return Center(
                  child:
                      widget.loadingBuilder?.call(context) ??
                      const CupertinoActivityIndicator(),
                );
              } else {
                return Center(
                  child:
                      widget.loadingBuilder?.call(context) ??
                      const CupertinoActivityIndicator(),
                );
              }
            }

            return widget.additionalWidgets![index - items.length];
          }

          return widget.itemBuilder(widget.options.fromJson(items[index]));
        }

        return _build(context, itemCount, itemBuilder);
      },
    );
  }

  int itemCount(int items) {
    var count = items;
    if (widget.additionalWidgets != null) {
      count += widget.additionalWidgets!.length;
    }
    if (pageInfo.hasNextPage) {
      count += 1;
    }
    return count;
  }

  Widget _build(
    BuildContext context,
    int itemCount,
    Widget Function(BuildContext, int) itemBuilder,
  );
}

typedef OnItemCount = void Function(int count);

class PaginationList<O> extends _Pagination<O> {
  const PaginationList({
    super.key,
    required super.options,
    required super.itemBuilder,
    super.path,
    super.loadingBuilder,
    super.additionalWidgets,
    this.padding,
    this.cacheExtend,
    this.scrollController,
    this.physics,
    this.separatorBuilder,
    this.onItemCount,
  });

  final EdgeInsetsGeometry? padding;
  final double? cacheExtend;
  final ScrollController? scrollController;
  final ScrollPhysics? physics;
  final Widget Function(BuildContext context, int index)? separatorBuilder;
  final OnItemCount? onItemCount;

  @override
  // ignore: library_private_types_in_public_api
  _PaginationListState<O> createState() => _PaginationListState<O>();
}

class _PaginationListState<O> extends _PaginationState<O, PaginationList<O>> {
  @override
  Widget _build(
    BuildContext context,
    int itemCount,
    Widget Function(BuildContext, int) itemBuilder,
  ) {
    widget.onItemCount?.call(itemCount);
    return ListView.separated(
      padding: widget.padding,
      itemBuilder: itemBuilder,
      separatorBuilder:
          widget.separatorBuilder ??
          (context, index) => const SizedBox(height: 0),
      itemCount: itemCount,
      cacheExtent: widget.cacheExtend,
      controller: widget.scrollController,
      physics: widget.physics,
    );
  }
}

class PaginationGrid<O> extends _Pagination<O> {
  const PaginationGrid({
    super.key,
    required super.options,
    required super.itemBuilder,
    super.path,
    super.loadingBuilder,
    super.additionalWidgets,
    this.reversed = false,
    required this.gridDelegate,
    this.padding,
    this.cacheExtend,
    this.scrollController,
    this.physics,
    this.onItemCount,
  });

  final SliverGridDelegate gridDelegate;
  final EdgeInsetsGeometry? padding;
  final double? cacheExtend;
  final ScrollController? scrollController;
  final ScrollPhysics? physics;
  final bool reversed;
  final OnItemCount? onItemCount;
  @override
  // ignore: library_private_types_in_public_api
  _PaginationGridState<O> createState() => _PaginationGridState<O>();
}

class _PaginationGridState<O> extends _PaginationState<O, PaginationGrid<O>> {
  @override
  Widget _build(
    BuildContext context,
    int itemCount,
    Widget Function(BuildContext, int) itemBuilder,
  ) {
    widget.onItemCount?.call(itemCount);
    return GridView.builder(
      gridDelegate: widget.gridDelegate,
      itemBuilder: itemBuilder,
      itemCount: itemCount,
      padding: widget.padding,
      cacheExtent: widget.cacheExtend,
      controller: widget.scrollController,
      physics: widget.physics,
      reverse: widget.reversed,
    );
  }
}
