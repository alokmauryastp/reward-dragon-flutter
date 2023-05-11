import 'package:flutter/material.dart';

import '../../constants/literals.dart';

class LoadingAndErrorScreen extends StatelessWidget {
  const LoadingAndErrorScreen({
    Key? key,
    required bool isLoading,
    required bool errorOccurred,
    required Function errorResolvingFunction,
    required Widget child,
  })  : _isLoading = isLoading,
        _errorOccurred = errorOccurred,
        _errorResolvingFunction = errorResolvingFunction,
        _child = child,
        super(key: key);

  final bool _isLoading;
  final bool _errorOccurred;
  final Widget _child;
  final Function _errorResolvingFunction;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    buildLoadingScreen() => Container(
          color: blackApp,
          alignment: Alignment.center,
          child: const CircularProgressIndicator(
            color: yellowApp,
            strokeWidth: 5,
          ),
        );

    buildErrorScreen() => Container(
          width: double.infinity,
          color: blackApp,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Something Went Wrong",
                style: TextStyle(
                  color: yellowApp,
                  fontWeight: FontWeight.w900,
                  fontSize: 18,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextButton(
                onPressed: () {
                  _errorResolvingFunction();
                },
                child: Container(
                  height: size.height * 0.06,
                  width: size.width * 0.25,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: yellowApp,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Text(
                    "Retry",
                    style: TextStyle(
                      color: blackApp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          // child: const CircularProgressIndicator(
          //   color: Colors.green,
          //   strokeWidth: 2,
          // ),
        );

    return SizedBox(
      width: size.width,
      height: size.height,
      child: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                _child,
                if (_isLoading) buildLoadingScreen(),
                if (_errorOccurred) buildErrorScreen(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
