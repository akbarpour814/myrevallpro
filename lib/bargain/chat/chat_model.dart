import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/bargain/chat_message/chat_message_widget.dart';
import '/components/chat_message_actions_widget.dart';
import '/components/notification_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/backend/schema/structs/index.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/request_manager.dart';

import 'chat_widget.dart' show ChatWidget;
import 'dart:async';
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ChatModel extends FlutterFlowModel<ChatWidget> {
  ///  Local state fields for this page.

  List<CheapsChatStruct> chatPageChips = [];
  void addToChatPageChips(CheapsChatStruct item) => chatPageChips.add(item);
  void removeFromChatPageChips(CheapsChatStruct item) =>
      chatPageChips.remove(item);
  void removeAtIndexFromChatPageChips(int index) =>
      chatPageChips.removeAt(index);
  void insertAtIndexInChatPageChips(int index, CheapsChatStruct item) =>
      chatPageChips.insert(index, item);
  void updateChatPageChipsAtIndex(
          int index, Function(CheapsChatStruct) updateFn) =>
      chatPageChips[index] = updateFn(chatPageChips[index]);

  ChatRoomStruct? chatRoom;
  void updateChatRoomStruct(Function(ChatRoomStruct) updateFn) =>
      updateFn(chatRoom ??= ChatRoomStruct());

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (Get Chat Room Details)] action in chat widget.
  ApiCallResponse? chatRoomDetails;
  // Stores action output result for [Backend Call - API (Mark As Read)] action in chat widget.
  ApiCallResponse? apiResult39c;
  bool apiRequestCompleted = false;
  String? apiRequestLastUniqueKey;
  // Models for ChatMessage dynamic component.
  late FlutterFlowDynamicModels<ChatMessageModel> chatMessageModels;
  // Model for chatMessageActions component.
  late ChatMessageActionsModel chatMessageActionsModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (send message)] action in Icon widget.
  ApiCallResponse? apiResult55u;

  /// Query cache managers for this widget.

  final _chatMessagesManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> chatMessages({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _chatMessagesManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearChatMessagesCache() => _chatMessagesManager.clear();
  void clearChatMessagesCacheKey(String? uniqueKey) =>
      _chatMessagesManager.clearRequest(uniqueKey);

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    chatMessageModels = FlutterFlowDynamicModels(() => ChatMessageModel());
    chatMessageActionsModel =
        createModel(context, () => ChatMessageActionsModel());
  }

  void dispose() {
    unfocusNode.dispose();
    chatMessageModels.dispose();
    chatMessageActionsModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    /// Dispose query cache managers for this widget.

    clearChatMessagesCache();
  }

  /// Action blocks are added here.

  Future pushNewMessage(
    BuildContext context, {
    dynamic message,
  }) async {}

  /// Additional helper methods are added here.

  Future waitForApiRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = apiRequestCompleted;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
