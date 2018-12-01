#pragma once

uint64_t GetRand(uint64_t nMax)
{
	if (nMax == 0)
		return 0;

	// The range of the random source must be a multiple of the modulus
	// to give every possible output value an equal possibility
	uint64_t nRange = (std::numeric_limits<uint64_t>::max() / nMax) * nMax;
	uint64_t nRand = 0;
	do {
		GetRandBytes((unsigned char*)&nRand, sizeof(nRand));
	} while (nRand >= nRange);
	return (nRand % nMax);
}
