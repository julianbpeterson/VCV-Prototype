
import("stdfaust.lib");
import("rack.lib");

// Using knobs (from 1 to 6). Knob [0..1] range is mapped on [min..max] slider range, taking 'scale' metadata in account

vol1 = hslider("volume1 [knob:1]", 0.1, 0, 1, 0.01);
freq1 = hslider("freq1 [knob:2] [unit:Hz] [scale:lin]", 300, 200, 300, 1);

vol2 = hslider("volume2 [knob:3]", 0.1, 0, 1, 0.01);
freq2 = hslider("freq2 [knob:4] [unit:Hz] ", 300, 200, 300, 1);

// Using switches (from 1 to 6)

gate = button("gate [switch:1]");

// Using bargraph to control leds (from 1 to 6 with 3 colors)

light_1_r = vbargraph("[light_red:1]", 0, 1);
light_1_g = vbargraph("[light_green:1]", 0, 1);
light_1_b = vbargraph("[light_blue:1]", 0, 1);

// Using bargraph to control switch leds (from 1 to 6 with 3 colors)

switch_2_r = vbargraph("[switch_red:2]", 0, 1);
switch_2_g = vbargraph("[switch_green:2]", 0, 1);
switch_2_b = vbargraph("[switch_blue:2]", 0, 1);

process = os.osc(freq1) * vol1, 
	os.sawtooth(freq2) * vol2 * gate,
	(os.osc(1):light_1_r + os.osc(1.4):light_1_g + os.osc(1.7):light_1_b),
	(os.osc(1):switch_2_r + os.osc(1.2):switch_2_g + os.osc(1.7):switch_2_b);
