#pragma once
// MIT license.
// A signal object may call multiple slots with the same signature.
// You can connect functions to the signal which will be called when
// the emit() method on the signal object is invoked.
// Any argument passed to emit() will be passed to the given functions.
// USAGE:
/*
#include "Signal.h"
#include <iostream>

int main() {
    // create new signal
    Signal<std::string, int> signal;

    // attach a slot
    signal.connect([](std::string arg1, int arg2) {
		std::cout << arg1 << " " << arg2 << std::endl;
    });

    signal.emit("The answer:", 42);
    return 0;
}
*/
#include <functional>
#include <map>

template <typename... Args>
class Signal {
public:
    Signal() {}
    // copy creates new signal
    Signal(Signal const& other) {}
	
	// assignment creates new Signal
    Signal& operator=(Signal const& other) {
        disconnect();
    }

    // connects a member function to this Signal
    template <typename T>
    int connect(T *inst, void (T::*func)(Args...)) {
        return connect([=](Args... args) {
            (inst->*func)(args...);
        });
    }

    // connects a const member function to this Signal
    template <typename T>
    int connect(T *inst, void (T::*func)(Args...) const) {
        return connect([=](Args... args) {
            (inst->*func)(args...);
        });
    }

    // connects a std::function to the signal. The returned
    // value can be used to disconnect the function again
    int connect(std::function<void(Args...)> const& slot) {
        _slots.insert(std::make_pair(++_lastId, slot));
        return _lastId;
    }

    // disconnects a previously connected function
    void disconnect(int id) {
        _slots.erase(id);
    }

    // disconnects all previously connected functions
    void disconnect() {
        _slots.clear();
    }

    // calls all connected functions
    void emit(Args... p)const {
        for (auto it: _slots) {
            it.second(p...);
        }
    }
private:
    std::map<int, std::function<void(Args...)>> _slots;
    int _lastId = 0;
};