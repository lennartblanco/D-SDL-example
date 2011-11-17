include config.mak

all: demo

demo: demo.d SDL.d SDL_events.d
	$(DC_CMD) demo.d

clean:
	rm -f demo *.o
