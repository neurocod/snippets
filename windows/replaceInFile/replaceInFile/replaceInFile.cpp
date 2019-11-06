//replaceInFile.cpp
#include <iostream>
#include <fstream>
#include <streambuf>
using std::string;

void printUsage() {
	std::cout << R"(Usage: replaceInFile.exe [-v for verbose] filePath textFrom textTo)";
}
void replaceAll(std::string& str, const std::string& from, const std::string& to) {
	if(from.empty())
		return;
	size_t start_pos = 0;
	while((start_pos = str.find(from, start_pos)) != std::string::npos) {
		str.replace(start_pos, from.length(), to);
		start_pos += to.length(); // In case 'to' contains 'from', like replacing 'x' with 'yx'
	}
}
int main(int argc, const char**argv) {
	if(argc < 4) {
		printUsage();
		return -1;
	}
	int arg = 1;
	bool verbose = false;
	string path = argv[arg++];
	if(path == "-?" || path=="/?" || path=="/h" || path=="-h") {
		printUsage();
		return 0;
	}
	if(path == "-v") {
		verbose = true;
		if(argc < 5) {
			printUsage();
			return -1;
		}
		path = argv[arg++];
	}
	const string from = argv[arg++];
	const string to = argv[arg++];
	std::ifstream stream(path.c_str());
	string strFile((std::istreambuf_iterator<char>(stream)),
				 std::istreambuf_iterator<char>());
	if(verbose) {
		std::cout << "path=" << path << std::endl;
		std::cout << "text=" << strFile << std::endl;
		std::cout << "from=" << from << std::endl;
		std::cout << "to=" << to << std::endl;
	}
	replaceAll(strFile, from, to);
	if(verbose) {
		std::cout << "newText=" << strFile << std::endl;
	}
	std::fstream wstream(path.c_str(), std::ios_base::out|std::ios_base::trunc);
	wstream << strFile;
	return 0;
}