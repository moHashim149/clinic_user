part of 'chat_cubit.dart';

@immutable
sealed class ChatState {}

final class ChatInitial extends ChatState {}

final class ChatLoading extends ChatState {}
final class ChatLoaded extends ChatState {}
final class ChatFailure extends ChatState {
  final String message;
  ChatFailure({required this.message});
}

final class SendMessageLoading extends ChatState {}
final class SendMessageLoaded extends ChatState {}
final class SendMessageFailure extends ChatState {
}




