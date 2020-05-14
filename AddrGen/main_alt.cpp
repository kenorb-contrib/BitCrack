//from /frstrtr/BitCrack/commit/4f4a7d9ea9684c4e8875c8dcf2507537e43f0396
#include <iostream>
#include <string>
#include "secp256k1.h"
#include "AddressUtil.h"

int main(int argc, char **argv)
{
    std::vector<secp256k1::uint256> keys;

	bool compressed = false;
    bool printPrivate = false;
    bool printPublic = false;
    bool printAddr = false;
    bool printAll = true;
    int count = 1;

	secp256k1::uint256 k;

	k = secp256k1::generatePrivateKey();

    secp256k1::ecpoint p = secp256k1::multiplyPoint(k, secp256k1::G());
    std::string address = Address::fromPublicKey(p, compressed);

    if(printAll || printPrivate) {
        std::cout << k.toString() << std::endl;
    }
    if(printAll || printPublic) {
        std::cout << p.toString() << std::endl;
    }
    if(printAll || printAddr) {
        std::cout << address << std::endl;
    }

	return 0;
} 
