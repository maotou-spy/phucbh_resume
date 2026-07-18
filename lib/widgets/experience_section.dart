import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:phucbh_resume/constants/colors.dart';

import '../utils/ex_util.dart';
import 'experience_card.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: screenWidth,
      padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
      child: Column(
        children: [
          const Text(
            "Job Experience",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColors.white,
            ),
          ),
          const SizedBox(height: 50),
          _HorizontalCardList(projects: workExUtils),
          const SizedBox(height: 80),
          const Text(
            "Personal Experience",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColors.white,
            ),
          ),
          const SizedBox(height: 50),
          _HorizontalCardList(projects: personalExUtils),
        ],
      ),
    );
  }
}

class _HorizontalCardList extends StatefulWidget {
  const _HorizontalCardList({required this.projects});
  final List<ExUtils> projects;

  @override
  State<_HorizontalCardList> createState() => _HorizontalCardListState();
}

class _HorizontalCardListState extends State<_HorizontalCardList> {
  final ScrollController _controller = ScrollController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onPointerSignal(PointerSignalEvent event) {
    if (event is PointerScrollEvent && _controller.hasClients) {
      // Translate vertical wheel/trackpad scroll into horizontal list movement.
      // Use animateTo for smoother motion instead of an immediate jump.
      final scrollDelta = event.scrollDelta.dy != 0
          ? event.scrollDelta.dy
          : event.scrollDelta.dx;
      final currentOffset = _controller.offset;
      final newOffset = (currentOffset + scrollDelta)
          .clamp(0.0, _controller.position.maxScrollExtent);
      if (newOffset == currentOffset) {
        return;
      }
      _controller.animateTo(
        newOffset,
        duration: const Duration(milliseconds: 150),
        curve: Curves.easeOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerSignal: _onPointerSignal,
      child: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(
          dragDevices: {
            PointerDeviceKind.touch,
            PointerDeviceKind.mouse,
            PointerDeviceKind.trackpad,
          },
        ),
        child: SingleChildScrollView(
          controller: _controller,
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (int i = 0; i < widget.projects.length; i++)
                Padding(
                  padding: EdgeInsets.only(
                    right: i == widget.projects.length - 1 ? 0 : 25,
                  ),
                  child: ExCardWidget(project: widget.projects[i]),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
