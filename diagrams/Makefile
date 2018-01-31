DIAGRAMS = xmidt-architecture.png \

all : $(DIAGRAMS)

clean :
	rm $(DIAGRAMS)

%.png : %.ditaa
	ditaa -E $< $@
