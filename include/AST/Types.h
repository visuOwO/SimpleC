#include <vector>
#include <string>
#include <iostream>

class Types {
    public:
        const static int INT = 0;
        const static int DOUBLE = 1;
        Types(int type, std::vector<int> Dims);
        explicit Types(int type);
        Types();
        ~Types();
        void check();
    private:
        std::vector<int> Dims;
        int type{};
};