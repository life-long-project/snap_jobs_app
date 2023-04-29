import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//import '../../../../Core/services/services_locator.dart';
import '../../../../core/utils/enums.dart';

import '../../controller/cubit/jobs_cubit.dart';
import '../../controller/cubit/jobs_state.dart';

//TODO: review this screen to be connected with themeData

class JobsScreen extends StatelessWidget {
  const JobsScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<JobsCubit, JobsState>(
        buildWhen: (previous, current) =>
            previous.getJobState != current.getJobState,
        builder: (context, state) {
          print('build JobsScreen');

          return ListView.builder(
              itemCount: state.jobs.length,
              //scrollDirection: ,
              itemBuilder: (BuildContext context, int index) {
                final jobs = state.jobs[index];
                return GestureDetector(
                  //allow on tab container of notes route edit
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) {
                    //     //return const JobDetail(
                    //       //sId: '',
                    //    // );
                    //   }),
                    // );
                  },

                  child: Container(
                    height: 200,
                    width: 400,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Card(
                      elevation: 40,

                      //padding: const EdgeInsets.only(left: 16, top: 24, bottom: 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const SizedBox(
                            height: 5,
                          ),
                          ListTile(
                            leading: CircleAvatar(
                              backgroundImage: NetworkImage(jobs.jobImgUrl),
                            ),
                            title: Text(
                              (jobs.jobName),
                              style: const TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                              ),
                            ),
                            subtitle: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: Column(
                                children: [
                                  Text(
                                    //date and time
                                    jobs.updatedAt,
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black.withOpacity(.4),
                                    ),
                                  ),
                                  Text(
                                    //date and time
                                    jobs.salary,
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black.withOpacity(.4),
                                    ),
                                  ),
                                  Text(
                                    //date and time
                                    jobs.jobLocation,
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black.withOpacity(.4),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            trailing: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.black,
                                size: 15,
                              ),
                            ),
                          ),
                          Padding(
                              //proposal
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 4),
                              child: TextButton(
                                onPressed: () {},
                                child: Text(
                                  'proposal',
                                  style: TextStyle(
                                    color: Colors.black.withOpacity(.9),
                                  ),
                                ),
                              ))
                        ],
                      ),
                    ),
                  ),
                );
              });

          // if (state.getJopState == RequestState.error) {
          //   return SizedBox(
          //     height: 170.0,
          //     child: Center(
          //       child: Text(state.message),
          //     ),
          //   );
          // }

          // case RequestState.error:
          //
        });
  }
}
