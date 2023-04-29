//get job from search
import 'package:equatable/equatable.dart';


import 'jobs.dart';

class JobSearch extends Equatable {
  final bool error;
  final String search;
  final List<String> skills;
  final List<Jobs> jobs;

  const JobSearch({ 
  required this.error,
  required this.search, 
  required this.skills, 
  required this.jobs});
  
  @override
  
  List<Object> get props => [
    error,
    search,
    skills,
    jobs,
    
  ];
}
