#!/usr/bin/env bash

echo "Downloading ngx_pagespeed ${NGINX_PAGESPEED_VERSION} from https://github.com/pagespeed/ngx_pagespeed/archive/${NGINX_PAGESPEED_VERSION}-${NGINX_PAGESPEED_RELEASE_STATUS}.tar.gz..."

wget --no-check-certificate -O - https://github.com/pagespeed/ngx_pagespeed/archive/${NGINX_PAGESPEED_VERSION}-${NGINX_PAGESPEED_RELEASE_STATUS}.tar.gz --progress=bar --tries=3 | tar zxf - -C /tmp

PSOL_URL=$(cat "/tmp/incubator-pagespeed-ngx-${NGINX_PAGESPEED_VERSION}-${NGINX_PAGESPEED_RELEASE_STATUS}/PSOL_BINARY_URL")

# The size names must match install/build_psol.sh in mod_pagespeed
if [ "$(uname -m)" = x86_64 ]; then
  PSOL_BIT_SIZE_NAME=x64
else
  PSOL_BIT_SIZE_NAME=ia32
fi

echo "Downloading ngx_pagespeed PSOL ${NGINX_PAGESPEED_VERSION} from ${PSOL_URL/\$BIT_SIZE_NAME/$PSOL_BIT_SIZE_NAME}..."

wget --no-check-certificate -O - ${PSOL_URL/\$BIT_SIZE_NAME/$PSOL_BIT_SIZE_NAME} --progress=bar --tries=3 | tar zxf - -C /tmp/incubator-pagespeed-ngx-${NGINX_PAGESPEED_VERSION}-${NGINX_PAGESPEED_RELEASE_STATUS}
ls /tmp/incubator-pagespeed-ngx-${NGINX_PAGESPEED_VERSION}-${NGINX_PAGESPEED_RELEASE_STATUS}
