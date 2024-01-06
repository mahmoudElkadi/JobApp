import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/repo/Message repo/Message_repo.dart';
import 'message_state.dart';

class MessageCubit extends Cubit<MessageState>{
  MessageCubit(this.messageRepo):super(MessageInitial());
  final MessageRepo messageRepo;
  static MessageCubit get(context) => BlocProvider.of(context);





}

