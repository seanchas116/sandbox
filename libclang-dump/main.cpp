#include <clang-c/Index.h>
#include <iostream>
#include <array>

auto visit(CXCursor cursor, CXCursor parent, CXClientData clientData) {
  auto spelling = clang_getCursorSpelling(cursor);
  std::cout << clang_getCString(spelling) << std::endl;
  clang_disposeString(spelling);
  return CXChildVisit_Recurse;
}

int main() {
  auto index = clang_createIndex(0, 1);

  std::array<char *, 0> args = {};
  auto translationUnit = clang_createTranslationUnitFromSourceFile(index, "test.cpp", args.size(), args.data(), 0, 0);
  clang_visitChildren(clang_getTranslationUnitCursor(translationUnit), &visit, nullptr);
  clang_disposeTranslationUnit(translationUnit);
}
