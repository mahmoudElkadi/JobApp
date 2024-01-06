import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobchat/features/Home/data/models/job.dart';
import 'package:jobchat/features/Home/data/repos/home_repo.dart';
import 'home_state.dart';



class HomeCubit extends Cubit<HomeState>{
  HomeCubit(this.homeRepo):super(HomeInitial());
  final HomeRepo homeRepo;
  static HomeCubit get(context) => BlocProvider.of(context);

  late Future<List<JobModel>> jobList;
  late Future<List<JobModel>> searchList;
  getAllJobs(){
    emit(HomeJobsLoading());
   try{
     jobList= homeRepo.getAllJob();
     emit(HomeJobsSuccess());
   }catch(error){
     emit(HomeJobsFailure());
   }

  }


   searchJobs(String text){
    emit(SearchJobsLoading());
    try{
      searchList= homeRepo.searchJob(text);
      emit(SearchJobsSuccess());
    }catch(error){
      emit(SearchJobsFailure());
    }

  }



}