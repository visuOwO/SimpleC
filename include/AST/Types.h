#include <vector>
#include <string>

class Types {
    public:
        const static int INT = 0;
        const static int DOUBLE = 1;
        Types(int type, std::vector<int> Dims);
        Types(int type);
        Types();
        ~Types();
    private:
        std::vector<int> Dims;
        int type{};
};