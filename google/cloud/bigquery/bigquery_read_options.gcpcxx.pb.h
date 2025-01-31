// Copyright 2021 Google LLC
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      https://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

// Generated by the Codegen C++ plugin.
// If you make any local changes, they will be lost.
// source: google/cloud/bigquery/storage/v1/storage.proto
#ifndef GOOGLE_CLOUD_CPP_GOOGLE_CLOUD_BIGQUERY_BIGQUERY_READ_OPTIONS_GCPCXX_PB_H
#define GOOGLE_CLOUD_CPP_GOOGLE_CLOUD_BIGQUERY_BIGQUERY_READ_OPTIONS_GCPCXX_PB_H

#include "google/cloud/bigquery/bigquery_read_connection.gcpcxx.pb.h"
#include "google/cloud/bigquery/bigquery_read_connection_idempotency_policy.gcpcxx.pb.h"
#include "google/cloud/backoff_policy.h"
#include "google/cloud/options.h"
#include "google/cloud/version.h"
#include <memory>

namespace google {
namespace cloud {
namespace bigquery {
inline namespace GOOGLE_CLOUD_CPP_GENERATED_NS {

/// Option to use with `google::cloud::Options`.
struct BigQueryReadRetryPolicyOption {
  using Type = std::shared_ptr<BigQueryReadRetryPolicy>;
};

/// Option to use with `google::cloud::Options`.
struct BigQueryReadBackoffPolicyOption {
  using Type = std::shared_ptr<BackoffPolicy>;
};

/// Option to use with `google::cloud::Options`.
struct BigQueryReadConnectionIdempotencyPolicyOption {
  using Type = std::shared_ptr<BigQueryReadConnectionIdempotencyPolicy>;
};

using BigQueryReadPolicyOptionList =
    OptionList<BigQueryReadRetryPolicyOption, BigQueryReadBackoffPolicyOption,
               BigQueryReadConnectionIdempotencyPolicyOption>;

}  // namespace GOOGLE_CLOUD_CPP_GENERATED_NS
}  // namespace bigquery
}  // namespace cloud
}  // namespace google

#endif  // GOOGLE_CLOUD_CPP_GOOGLE_CLOUD_BIGQUERY_BIGQUERY_READ_OPTIONS_GCPCXX_PB_H
