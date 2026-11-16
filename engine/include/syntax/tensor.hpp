#pragma once       // Prevents this header from being included multiple times
#include <cstddef> // Provides std::size_t for sizes and dimensions
#include <vector>  // Provides std::vector for storing arrays of values

class Tensor {
private:
  // Stores the tensor's dimensions, e.g. {2, 3} = 2 rows, 3 columns
  std::vector<std::size_t> shape_;

  // Stores the actual floating-point numbers inside the tensor
  std::vector<float> data_;

public:
  // Constructor: receives the tensor's shape and initializes shape_
  Tensor(std::vector<std::size_t> shape) : shape_(shape) {

    // Start at 1 because we're multiplying dimensions together
    std::size_t total = 1;

    // Loop through every dimension and multiply them together
    for (auto n : shape_) {
      total *= n;
    }
    data_.resize(total);
  }
};
