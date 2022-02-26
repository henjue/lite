import 'dart:io';

import 'package:xterm/xterm.dart';
import 'package:pty/pty.dart';
class LocalTerminalBackend extends TerminalBackend{
  PseudoTerminal pty;

  LocalTerminalBackend(this.pty);

  @override
  void ackProcessed() {

  }

  @override
  Future<int> get exitCode => pty.exitCode;

  @override
  void init() {

  }

  @override
  Stream<String> get out => pty.out;

  @override
  void resize(int width, int height, int pixelWidth, int pixelHeight) {
    pty.resize(width, height);
  }

  @override
  void terminate() {
    pty.kill(ProcessSignal.sigkill);
  }

  @override
  void write(String input) {
    pty.write(input);
  }
}
