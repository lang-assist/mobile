part of '../api.dart';

setToken(String token) {
  _httpClient.setToken(token);
  _headers["authorization"] = "Bearer $token";
  //_socketConfig.headers!.addAll(_headers);
}

setDeviceId(String deviceId) {
  _headers["x-device-id"] = deviceId;
  _httpClient.setDeviceId(deviceId);
  //_socketConfig.headers!.addAll(_headers);
}

const host = "127.0.0.1";
const port = "3000";

const secure = false;
final String _baseUrl = "${secure ? "https" : "http"}://$host:$port";

String audioIdToUrl(String audioId) {
  return "$_baseUrl/storage/audio/$audioId";
}

String pictureIdToUrl(String pictureId) {
  return "$_baseUrl/storage/item-picture/$pictureId";
}

Future<String> uploadAudio(Uint8List buffer, String mimeType) async {
  final multipart = http.MultipartRequest(
    "POST",
    Uri.parse("$_baseUrl/storage/audio"),
  );
  multipart.files.add(
    http.MultipartFile.fromBytes("audio", buffer, filename: "audio.wav"),
  );
  multipart.headers.addAll(_headers);

  final res = await multipart.send();

  if (res.statusCode != 200) {
    throw Exception("Failed to upload audio");
  }

  final body = await res.stream.bytesToString();

  final jsonBody = jsonDecode(body);

  return jsonBody["id"];
}

final _httpClient = GlobalClient(false);

final Map<String, String> _headers = {};

final _socketConfig = SocketClientConfig(
  initialPayload: () {
    return _headers;
  },
  autoReconnect: false,
);

final ValueNotifier<GraphQLClient> clientNotifier = ValueNotifier(
  GraphQLClient(
    link: Link.split(
      (req) => req.isSubscription,
      WebSocketLink(
        "${secure ? "wss" : "ws"}://$host:$port/graphql",
        subProtocol: GraphQLProtocol.graphqlTransportWs,
        config: _socketConfig,
      ),
      HttpLink("$_baseUrl/graphql", httpClient: _httpClient),
    ),
    cache: GraphQLCache(store: InMemoryStore()),
    queryRequestTimeout: Duration(minutes: 2),
    defaultPolicies: DefaultPolicies(
      query: Policies(
        fetch: FetchPolicy.networkOnly,
        cacheReread: CacheRereadPolicy.ignoreAll,
      ),
      mutate: Policies(
        fetch: FetchPolicy.networkOnly,
        cacheReread: CacheRereadPolicy.ignoreAll,
      ),
    ),
  ),
);

GraphQLClient get client => clientNotifier.value;

class GlobalClient extends http.BaseClient {
  String? _token;
  String? _deviceId;

  Map<String, String> get _additionalHeaders => {
    if (_token != null) "authorization": "Bearer $_token",
    if (_deviceId != null) "x-device-id": _deviceId!,
  };

  final bool isSubscription;

  GlobalClient(this.isSubscription);

  final http.Client _client = http.Client();

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) async {
    request.headers.addAll(_additionalHeaders);
    // if (isSubscription) {
    //   request.url.queryParameters ??= {};

    //   if (_token != null) {
    //     request.url.queryParameters["token"] = _token!;
    //   }
    //   if (_deviceId != null) {
    //     request.url.queryParameters["deviceId"] = _deviceId!;
    //   }
    // }
    final res = await _client.send(request);
    return res;
  }

  setToken(String token) {
    _token = token;
  }

  setDeviceId(String deviceId) {
    _deviceId = deviceId;
  }
}
