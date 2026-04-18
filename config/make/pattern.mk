# ******************
# *** C Patterns ***
# ******************

$(OBJECT_FOLDER_MAIN)/%.c.o: $(SOURCE_FOLDER_MAIN)/%.c
	@mkdir -p $(dir $@)
	$(CC) $(CFLAGS) -O2 -c $< -o $@

-include $(OBJECT_FOLDER_MAIN)/*.d

$(OBJECT_FOLDER_UTILS)/%.c.o: $(SOURCE_FOLDER_UTILS)/%.c
	@mkdir -p $(dir $@)
	$(CC) $(CFLAGS) -fPIC -O2 -c $< -o $@

-include $(OBJECT_FOLDER_UTILS)/*.d

$(OBJECT_FOLDER_INPUT)/%.c.o: $(SOURCE_FOLDER_INPUT)/%.c
	@mkdir -p $(dir $@)
	$(CC) $(CFLAGS) -O3 -c $< -o $@

-include $(OBJECT_FOLDER_INPUT)/*.d

$(OBJECT_FOLDER_OUTPUT)/%.c.o: $(SOURCE_FOLDER_OUTPUT)/%.c
	@mkdir -p $(dir $@)
	$(CC) $(CFLAGS) -Os -c $< -o $@

-include $(OBJECT_FOLDER_OUTPUT)/*.d

# **********************
# *** COBOL Patterns ***
# **********************

$(OBJECT_FOLDER_MAIN)/%.cbl.o: $(SOURCE_FOLDER_MAIN)/%.cbl
	@mkdir -p $(dir $@)
	$(COB) $(COBFLAGS) -c $< -o $@
	@mv *.d $(dir $@)

-include $(OBJECT_FOLDER_MAIN)/*.d

$(OBJECT_FOLDER_UTILS)/%.cbl.o: $(SOURCE_FOLDER_UTILS)/%.cbl
	@mkdir -p $(dir $@)
	$(COB) $(COBFLAGS) -c $< -o $@
	@mv *.d $(dir $@)

-include $(OBJECT_FOLDER_UTILS)/*.d

$(OBJECT_FOLDER_INPUT)/%.cbl.o: $(SOURCE_FOLDER_INPUT)/%.cbl
	@mkdir -p $(dir $@)
	$(COB) $(COBFLAGS) -c $< -o $@
	@mv *.d $(dir $@)

-include $(OBJECT_FOLDER_INPUT)/*.d

$(OBJECT_FOLDER_OUTPUT)/%.cbl.o: $(SOURCE_FOLDER_OUTPUT)/%.cbl
	@mkdir -p $(dir $@)
	$(COB) $(COBFLAGS) -c $< -o $@
	@mv *.d $(dir $@)

-include $(OBJECT_FOLDER_OUTPUT)/*.d