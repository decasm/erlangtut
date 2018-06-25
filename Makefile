#OUTDIR = ../ebin
##EFLAGS = -I ../inc -DNOTEST
#EFLAGS = -I ../inc
#OBJS	= \
#	$(OUTDIR)/marc.beam \
#	$(OUTDIR)/marc_read.beam \
#	$(OUTDIR)/marc_write.beam \
#	$(OUTDIR)/util.beam
#
#all:	make_dest $(OBJS)
#
#$(OUTDIR)/%.beam:	%.erl
#	erlc -W $(EFLAGS) -o $(OUTDIR) $<
#
#make_dest:
#	mkdir -p $(OUTDIR)

clean:
	rm *.beam

