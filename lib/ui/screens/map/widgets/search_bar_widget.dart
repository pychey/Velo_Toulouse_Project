import 'package:flutter/material.dart';
import '../../../theme/theme.dart';

class SearchBarWidget extends StatefulWidget {
  const SearchBarWidget({
    super.key,
    required this.initialValue,
    required this.onSubmit,
  });

  final String initialValue;
  final ValueChanged<String> onSubmit;

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialValue);
  }

  @override
  void didUpdateWidget(covariant SearchBarWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.initialValue != widget.initialValue &&
        widget.initialValue != _controller.text) {
      _controller.text = widget.initialValue;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.border),
        boxShadow: AppShadows.button,
      ),
      child: Row(
        children: [
          const SizedBox(width: 12),
          const Icon(Icons.search, size: 20, color: AppColors.textMuted),
          const SizedBox(width: 8),
          Expanded(
            child: TextField(
              controller: _controller,
              textInputAction: TextInputAction.search,
              onSubmitted: widget.onSubmit,
              style: AppTextStyles.bodyMd.copyWith(fontSize: 14),
              decoration: InputDecoration(
                isCollapsed: true,
                border: InputBorder.none,
                hintText: 'Search a station',
                hintStyle: AppTextStyles.bodySm.copyWith(
                  color: AppColors.textMuted,
                ),
              ),
            ),
          ),
          if (_controller.text.isNotEmpty)
            GestureDetector(
              onTap: () {
                _controller.clear();
                widget.onSubmit('');
                setState(() {});
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Icon(Icons.close, size: 18, color: AppColors.textMuted),
              ),
            ),
          GestureDetector(
            onTap: () => widget.onSubmit(_controller.text),
            child: Container(
              margin: const EdgeInsets.all(4),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: AppColors.brandPrimary,
                borderRadius: BorderRadius.circular(6),
              ),
              child: const Icon(Icons.arrow_forward, size: 16, color: AppColors.white),
            ),
          ),
        ],
      ),
    );
  }
}