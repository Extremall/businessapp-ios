echo "Start"

curVer=`/usr/libexec/PlistBuddy "${INPUT_FILE_PATH}/.xccurrentversion" -c 'print _XCCurrentVersionName'`
mogenerator --model "${INPUT_FILE_PATH}/$curVer" --machine-dir "${PROJECT_DIR}/BusinessApp/Model/Data/Private/" --human-dir "${PROJECT_DIR}/BusinessApp/Model/Data/" --template-var arc=true

${DEVELOPER_BIN_DIR}/momc -XD_MOMC_TARGET_VERSION=10.6 "${INPUT_FILE_PATH}" "${TARGET_BUILD_DIR}/${EXECUTABLE_FOLDER_PATH}/${INPUT_FILE_BASE}.momd"

echo "Mogend.sh is done"