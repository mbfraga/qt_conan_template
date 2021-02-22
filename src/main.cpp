#include <QApplication>
#include <QMainWindow>
#include <test_widget.h>

int main(int argc, char* argv[])
{
  QApplication app(argc, argv);

  QMainWindow mw;
  mw.setCentralWidget(new TestWidget(&mw));
  mw.show();

  return app.exec();
}
