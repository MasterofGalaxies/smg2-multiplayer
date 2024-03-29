CROSS_COMPILE ?= powerpc-eabi-

CC ?= $(CROSS_COMPILE)gcc
AS ?= $(CROSS_COMPILE)as
LD ?= $(CROSS_COMPILE)ld
KAMEK ?= Kamek

CFLAGS ?= -O2 -Wall

ADDRESS ?= 0x80002A00

O_FILES = multiplayer.o teleportandsetcamera.o SuperSpinDriver.o khooks.o

REGION ?= us
SYMBOL_MAP ?= symbols-$(REGION).txt
DEFINES += -D$(REGION)

ifneq ($(BUBBLE),)
	DEFINES += -DBUBBLE
endif

ifneq ($(SPLITSCREEN),)
	DEFINES += -DSPLITSCREEN
	O_FILES += splitscreen.o
endif

all: multiplayerpatch.xml multiplayerpatch.ini

clean:
	rm -f $(O_FILES) splitscreen.o multiplayerpatch.o multiplayerpatch.xml multiplayerpatch.ini


%.o: %.s
	$(AS) -o $@ $<

%.o: %.S
	$(CC) $(DEFINES) -c -o $@ $<

%.o: %.c
	$(CC) $(CFLAGS) $(DEFINES) -c -o $@ $<

# Kamek can't link symbols across multiple object files, so
# combine all our object files into one and pass that to Kamek.
multiplayerpatch.o: $(O_FILES)
	$(LD) --relocatable -o $@ $(O_FILES)

multiplayerpatch.xml: multiplayerpatch.o
	$(KAMEK) -static=$(ADDRESS) -externals=$(SYMBOL_MAP) -output-riiv=$@ $<

multiplayerpatch.ini: multiplayerpatch.o
	$(KAMEK) -static=$(ADDRESS) -externals=$(SYMBOL_MAP) -output-dolphin=$@ $<
