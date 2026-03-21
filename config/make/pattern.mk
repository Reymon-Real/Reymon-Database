# **********************
# *** COBOL Patterns ***
# **********************

$(OBJECT_FOLDER_INPUT)/%.cbl.o: $(SOURCE_FOLDER_INPUT)/%.cbl
	@mkdir -p $(dir $@)
	$(COB) $(COBFLAGS) -O3 -c $< -o $@

$(OBJECT_FOLDER_OUTPUT)/%.cbl.o: $(SOURCE_FOLDER_OUTPUT)/%.cbl
	@mkdir -p $(dir $@)
	$(COB) $(COBFLAGS) -Os -c $< -o $@