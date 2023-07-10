import 'package:flutter/material.dart';
import 'package:snap_jobs/Jobs_feature/domain/entities/post_job_entity.dart';

import '../widgets/job_detail_page/job_detail.dart';

class JobDetailPage extends StatelessWidget {
  final JobPost post;
  const JobDetailPage({
    Key? key,
    required this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppbar() {
    return AppBar(
      title: const Text("Job Detail"),
    );
  }

  Widget _buildBody() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: JobDetailWidget(post: post),
      ),
    );
  }
}
