part of optional_test;

void runAsyncTests() {
  ChatViewLoader bloc;
  ChatRepository repository;

  setUp(() {
    repository = ChatRepository();
    bloc = ChatViewLoader(repository, ChatViewFactory());
  });

  test('creates chat if chat from repo is empty', () async {
    repository.returnEmpty = true;

    final view = await bloc.loadOrCreateChat('id');

    expect(view.fromRepo, false);
  });
  test('does not create chat if chat from repo is non-empty', () async {
    repository.returnEmpty = false;

    final view = await bloc.loadOrCreateChat('id');

    expect(view.fromRepo, true);
  });
}

class ChatViewLoader {
  final ChatRepository repository;
  final ChatViewFactory chatViewFactory;

  ChatViewLoader(this.repository, this.chatViewFactory);

  Future<Chat> _createChat(String id) async {
    return Chat(false);
  }

  Future<ChatView> loadOrCreateChat(String id) async {
    final maybeChat = await repository.loadChat(id);
    final chat = await maybeChat.orElseGet(() => _createChat(id));
    return chatViewFactory.createView(chat);
  }
}

class ChatRepository {
  bool returnEmpty = true;
  Future<Optional<Chat>> loadChat(String id) async {
    return returnEmpty ? Optional.empty() : Optional.of(Chat(true));
  }
}

class Chat {
  final bool fromRepo;

  Chat(this.fromRepo);
}

class ChatView {
  final bool fromRepo;

  ChatView(this.fromRepo);
}

class ChatViewFactory {
  Future<ChatView> createView(FutureOr<Chat> chat) async {
    return ChatView((await chat).fromRepo);
  }
}
