CROSS_COMPILE ?= powerpc-eabi-

CC ?= $(CROSS_COMPILE)gcc
AS ?= $(CROSS_COMPILE)as
LD ?= $(CROSS_COMPILE)ld
KAMEK ?= Kamek

CFLAGS ?= -O2 -Wall

ADDRESS ?= 0x80002A00

O_FILES = multiplayer.o teleportandsetcamera.o SuperSpinDriver.o khooks.o

SYMBOL_MAP ?= symbols.txt

ifneq ($(BUBBLE),)
	DEFINES += -DBUBBLE
endif

ifneq ($(PAL),)
	DEFINES += -DEU
endif

all: multiplayerpatch.xml

clean:
	rm -f $(O_FILES) multiplayerpatch.o multiplayerpatch.xml


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
