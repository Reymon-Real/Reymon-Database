# ******************
# *** C Patterns ***
# ******************

$(OBJECT_FOLDER_UTILS)/%.c.o: $(SOURCE_FOLDER_UTILS)/%.c
	@mkdir -p $(dir $@)
	$(CC) $(CFLAGS) -O2 -c $< -o $@

$(OBJECT_FOLDER_INPUT)/%.c.o: $(SOURCE_FOLDER_INPUT)/%.c
	@mkdir -p $(dir $@)
	$(CC) $(CFLAGS) -O3 -c $< -o $@

$(OBJECT_FOLDER_OUTPUT)/%.c.o: $(SOURCE_FOLDER_OUTPUT)/%.c
	@mkdir -p $(dir $@)
	$(CC) $(CFLAGS) -Os -c $< -o $@

# **********************
# *** COBOL Patterns ***
# **********************

$(OBJECT_FOLDER_UTILS)/%.cbl.o: $(SOURCE_FOLDER_UTILS)/%.cbl
	@mkdir -p $(dir $@)
	$(COB) $(COBFLAGS) -c $< -o $@

$(OBJECT_FOLDER_INPUT)/%.cbl.o: $(SOURCE_FOLDER_INPUT)/%.cbl
	@mkdir -p $(dir $@)
	$(COB) $(COBFLAGS) -c $< -o $@

$(OBJECT_FOLDER_OUTPUT)/%.cbl.o: $(SOURCE_FOLDER_OUTPUT)/%.cbl
	@mkdir -p $(dir $@)
	$(COB) $(COBFLAGS) -c $< -o $@