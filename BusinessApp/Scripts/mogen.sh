#  mogen.sh
#  Ginza
#
#  Created by Виктор Заикин on 28.03.14.
#  Copyright (c) 2014 behappy. All rights reserved.

mogenerator --model "${INPUT_FILE_PATH}" --machine-dir "${PROJECT_DIR}/BusinessApp/Model/Data/Private/" --human-dir "${PROJECT_DIR}/BusinessApp/Model/Data/" --template-var arc=true

${DEVELOPER_BIN_DIR}/momc -XD_MOMC_TARGET_VERSION=10.6 "${INPUT_FILE_PATH}" "${TARGET_BUILD_DIR}/${EXECUTABLE_FOLDER_PATH}/${INPUT_FILE_BASE}.mom"

echo "Mogen.sh is done"