import { createRequire } from 'module';

const require = createRequire(import.meta.url);

// SPDX-FileCopyrightText: Copyright Orangebot, Inc. and Medplum contributors
// SPDX-License-Identifier: Apache-2.0
const nextConfig = {
  reactStrictMode: true,
  swcMinify: true,
};

export default nextConfig;
