#include <iostream>
#include <boost/program_options.hpp>

int main(int argc, char *argv[])
{
  // オプションの設定
  namespace po = boost::program_options;
  po::options_description opt("options");
  opt.add_options()
    ("aaa,a", po::value<std::string>(), "usage: aaa=?")
    ("help", "print help message");

  // 位置オプションの設定
  po::positional_options_description popt;
  popt.add("aaa", 1);
  
  po::variables_map vm;
  po::store(po::command_line_parser(argc, argv).options(opt).positional(popt).run(), vm);
  po::notify(vm);
  if (vm.count("help") || !vm.count("aaa"))
  {
    std::cout << opt << std::endl;
    return 1;
  }
  std::string aaa= vm["aaa"].as<std::string>();

  std::cout << "Hello, world!" << std::endl;
  
  return 0;
}
