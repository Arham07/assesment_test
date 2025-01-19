import 'dart:convert';

class TrendingModel {
  final int totalCount;
  final bool incompleteResults;
  final List<Repository> items;

  TrendingModel({
    required this.totalCount,
    required this.incompleteResults,
    required this.items,
  });

  factory TrendingModel.fromJson(Map<String, dynamic> json) {
    return TrendingModel(
      totalCount: json['total_count'],
      incompleteResults: json['incomplete_results'],
      items: (json['items'] as List)
          .map((item) => Repository.fromJson(item))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'total_count': totalCount,
      'incomplete_results': incompleteResults,
      'items': items.map((item) => item.toJson()).toList(),
    };
  }
}

class Repository {
  final int id;
  final String nodeId;
  final String name;
  final String fullName;
  final bool private;
  final Owner owner;
  final String htmlUrl;
  final String? description;
  final bool fork;
  final String url;
  final String createdAt;
  final String updatedAt;
  final String pushedAt;
  final int size;
  final int stargazersCount;
  final int watchersCount;
  final String language;
  final int forksCount;
  final License? license;
  final bool hasIssues;
  final bool hasProjects;
  final bool hasDownloads;
  final bool hasWiki;
  final bool hasPages;
  final bool archived;
  final bool disabled;
  final int openIssuesCount;
  final List<String> topics;
  final String visibility;
  final String defaultBranch;

  Repository({
    required this.id,
    required this.nodeId,
    required this.name,
    required this.fullName,
    required this.private,
    required this.owner,
    required this.htmlUrl,
    required this.description,
    required this.fork,
    required this.url,
    required this.createdAt,
    required this.updatedAt,
    required this.pushedAt,
    required this.size,
    required this.stargazersCount,
    required this.watchersCount,
    required this.language,
    required this.forksCount,
    this.license,
    required this.hasIssues,
    required this.hasProjects,
    required this.hasDownloads,
    required this.hasWiki,
    required this.hasPages,
    required this.archived,
    required this.disabled,
    required this.openIssuesCount,
    required this.topics,
    required this.visibility,
    required this.defaultBranch,
  });

  factory Repository.fromJson(Map<String, dynamic> json) {
    return Repository(
      id: json['id'],
      nodeId: json['node_id'],
      name: json['name'],
      fullName: json['full_name'],
      private: json['private'],
      owner: Owner.fromJson(json['owner']),
      htmlUrl: json['html_url'],
      description: json['description'],
      fork: json['fork'],
      url: json['url'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      pushedAt: json['pushed_at'],
      size: json['size'],
      stargazersCount: json['stargazers_count'],
      watchersCount: json['watchers_count'],
      language: json['language'],
      forksCount: json['forks_count'],
      license: json['license'] != null
          ? License.fromJson(json['license'])
          : null,
      hasIssues: json['has_issues'],
      hasProjects: json['has_projects'],
      hasDownloads: json['has_downloads'],
      hasWiki: json['has_wiki'],
      hasPages: json['has_pages'],
      archived: json['archived'],
      disabled: json['disabled'],
      openIssuesCount: json['open_issues_count'],
      topics: List<String>.from(json['topics']),
      visibility: json['visibility'],
      defaultBranch: json['default_branch'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'node_id': nodeId,
      'name': name,
      'full_name': fullName,
      'private': private,
      'owner': owner.toJson(),
      'html_url': htmlUrl,
      'description': description,
      'fork': fork,
      'url': url,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'pushed_at': pushedAt,
      'size': size,
      'stargazers_count': stargazersCount,
      'watchers_count': watchersCount,
      'language': language,
      'forks_count': forksCount,
      'license': license?.toJson(),
      'has_issues': hasIssues,
      'has_projects': hasProjects,
      'has_downloads': hasDownloads,
      'has_wiki': hasWiki,
      'has_pages': hasPages,
      'archived': archived,
      'disabled': disabled,
      'open_issues_count': openIssuesCount,
      'topics': topics,
      'visibility': visibility,
      'default_branch': defaultBranch,
    };
  }
}

class Owner {
  final String login;
  final int id;
  final String avatarUrl;
  final String htmlUrl;

  Owner({
    required this.login,
    required this.id,
    required this.avatarUrl,
    required this.htmlUrl,
  });

  factory Owner.fromJson(Map<String, dynamic> json) {
    return Owner(
      login: json['login'],
      id: json['id'],
      avatarUrl: json['avatar_url'],
      htmlUrl: json['html_url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'login': login,
      'id': id,
      'avatar_url': avatarUrl,
      'html_url': htmlUrl,
    };
  }
}

class License {
  final String key;
  final String name;
  final String spdxId;
  final String url;

  License({
    required this.key,
    required this.name,
    required this.spdxId,
    required this.url,
  });

  factory License.fromJson(Map<String, dynamic> json) {
    return License(
      key: json['key'],
      name: json['name'],
      spdxId: json['spdx_id'],
      url: json['url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'key': key,
      'name': name,
      'spdx_id': spdxId,
      'url': url,
    };
  }
}
