#pragma once
#include <limits>
#include <time.h>
#include <QObject>

// Define C99 equivalent types.
using int8_t = qint8;
using int16_t = qint16;
using int32_t = qint32;
using uint8_t = quint8;
using uint16_t = quint16;
using uint32_t = quint32;

static const unsigned int MAX_VALUE_LENGTH = 20*1024;
#define LogPrintf printf

void RandFailure() {
	LogPrintf("Failed to read randomness, aborting\n");
	abort();
}

//OpenSSL
int RAND_bytes(unsigned char *buf, int num);

void GetRandBytes(unsigned char* buf, int num)
{
	if (RAND_bytes(buf, num) != 1) {
		RandFailure();
	}
}

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
