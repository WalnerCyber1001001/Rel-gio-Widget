import 'dart:ui' as ui;
import 'package:flutter/material.dart';

class BackgroundImageWidget extends StatelessWidget {
  final ui.Image backgroundImage;
  final bool isRoundOrSquare;
  final double imageDiameter;
  final bool isRoundedBorders;

  const BackgroundImageWidget({
    required this.backgroundImage,
    required this.isRoundOrSquare,
    required this.imageDiameter,
    required this.isRoundedBorders,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // Obtém as dimensões da janela
    final windowSize = MediaQuery.of(context).size;
    final windowWidth = windowSize.width;
    final windowHeight = windowSize.height;

    return Center(
      child: isRoundOrSquare
          ? ClipOval(
              child: ShaderMask(
                shaderCallback: (Rect bounds) {
                  // Ajusta o Matrix4 com base na largura e altura da janela
                  final matrix = (windowWidth < 200 || windowHeight < 200)
                      ? Matrix4.identity().scaled(imageDiameter / 500)
                      : Matrix4.identity()
                          .scaled(imageDiameter / backgroundImage.width);

                  return ImageShader(
                    backgroundImage,
                    TileMode.repeated,
                    TileMode.repeated,
                    matrix.storage,
                  );
                },
                blendMode: BlendMode.srcATop,
                child: Container(
                  width: imageDiameter,
                  height: imageDiameter,
                  color: Colors.white,
                ),
              ),
            )
          : ShaderMask(
              shaderCallback: (Rect bounds) {
                // Ajusta o Matrix4 com base na largura e altura da janela
                final matrix = (windowWidth < 200 || windowHeight < 200)
                    ? Matrix4.identity().scaled(imageDiameter / 500)
                    : Matrix4.identity()
                        .scaled(imageDiameter / backgroundImage.width);

                return ImageShader(
                  backgroundImage,
                  TileMode.repeated,
                  TileMode.repeated,
                  matrix.storage,
                );
              },
              blendMode: BlendMode.srcATop,
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      isRoundedBorders ? BorderRadius.circular(52.0) : null,
                ),
              ),
            ),
    );
  }
}
