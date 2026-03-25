# ***************************
# *** Create Object Files ***
# ***************************

$(OBJECT_FILE_MAIN_C): $(SOURCE_FILE_MAIN_C)
	@mkdir -p $(dir $@)
	$(CC) $(CFLAGS) -O3 -c $< -o $@

# ************************
# *** Create Libraries ***
# ************************

$(LIBRARY_FOLDER)/$(BINARY_FILE_LIBRARY_SHARED_REYDB): $(FIND_OBJECT_FILES_UTILS_COBOL) $(FIND_OBJECT_FILES_UTILS_C) $(FIND_OBJECT_FILES_INPUT_COBOL) $(FIND_OBJECT_FILES_INPUT_C) $(FIND_OBJECT_FILES_OUTPUT_COBOL) $(FIND_OBJECT_FILES_OUTPUT_C)
	@mkdir -p $(dir $@)
	$(COB) $(LDFIND) -dso -o $@ $^ $(LD_DYNAMIC_LINK)

# **************************
# *** Create Executables ***
# **************************

$(BINARY_FILE_EXECUTABLE_TEST): $(OBJECT_FILE_MAIN_C) $(LIBRARY_FOLDER)/$(BINARY_FILE_LIBRARY_SHARED_REYDB)
	@mkdir -p $(dir $@)
	$(LD) $(LDFLAGS) -o $@ $< -l:libreydb.so $(LD_RELATIVE_PATH)
	@patchelf --set-rpath '$$ORIGIN/lib' $@