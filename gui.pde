/* =========================================================
 * ====                   WARNING                        ===
 * =========================================================
 * The code in this tab has been generated from the GUI form
 * designer and care should be taken when editing this file.
 * Only add/edit code inside the event handlers i.e. only
 * use lines between the matching comment tags. e.g.
 
 void myBtnEvents(GButton button) { //_CODE_:button1:12356:
 // It is safe to enter your event code here  
 } //_CODE_:button1:12356:
 
 * Do not rename this tab!
 * =========================================================
 */

synchronized public void win_draw1(PApplet appc, GWinData data) { //_CODE_:gui_window:345207:
    appc.background(230);
} //_CODE_:gui_window:345207:

public void amplitude_slider_change(GCustomSlider source, GEvent event) { //_CODE_:amplitude_slider:284622:
    println("amplitude_slider - GCustomSlider >> GEvent." + event + " @ " + millis());
    terrain.amplitude = map(source.getValueF(), 1, 10, 50, 150);
} //_CODE_:amplitude_slider:284622:

public void water_slider_change1(GCustomSlider source, GEvent event) { //_CODE_:water_slider:530167:
    println("custom_slider1 - GCustomSlider >> GEvent." + event + " @ " + millis());
    terrain.waterLevel = int(map(source.getValueF(), 1, 10, -100, 100));
} //_CODE_:water_slider:530167:

public void play_speed_turn1(GKnob source, GEvent event) { //_CODE_:play_speed:592264:
    println("play_speed - GKnob >> GEvent." + event + " @ " + millis());
    terrain.playSpeed = source.getValueF();
} //_CODE_:play_speed:592264:



// Create all the GUI controls. 
// autogenerated do not edit
public void createGUI() {
    G4P.messagesEnabled(false);
    G4P.setGlobalColorScheme(GCScheme.BLUE_SCHEME);
    G4P.setMouseOverEnabled(false);
    surface.setTitle("Sketch Window");
    gui_window = GWindow.getWindow(this, "Terrain Generator Controls", 0, 0, 240, 360, JAVA2D);
    gui_window.noLoop();
    gui_window.setActionOnClose(G4P.KEEP_OPEN);
    gui_window.addDrawHandler(this, "win_draw1");
    amplitude_slider = new GCustomSlider(gui_window, 39, 39, 143, 40, "grey_blue");
    amplitude_slider.setShowValue(true);
    amplitude_slider.setLimits(5, 1, 10);
    amplitude_slider.setNbrTicks(10);
    amplitude_slider.setNumberFormat(G4P.INTEGER, 0);
    amplitude_slider.setOpaque(false);
    amplitude_slider.addEventHandler(this, "amplitude_slider_change");
    amplitude_label = new GLabel(gui_window, 38, 20, 110, 20);
    amplitude_label.setText("Terrain Amplitude");
    amplitude_label.setOpaque(false);
    water_slider = new GCustomSlider(gui_window, 39, 119, 143, 40, "grey_blue");
    water_slider.setShowValue(true);
    water_slider.setLimits(5, 1, 10);
    water_slider.setNbrTicks(10);
    water_slider.setNumberFormat(G4P.INTEGER, 0);
    water_slider.setOpaque(false);
    water_slider.addEventHandler(this, "water_slider_change1");
    water_label = new GLabel(gui_window, 39, 100, 80, 20);
    water_label.setText("Water Level");
    water_label.setOpaque(false);
    play_speed = new GKnob(gui_window, 81, 195, 60, 60, 0.8);
    play_speed.setTurnRange(110, 70);
    play_speed.setTurnMode(GKnob.CTRL_HORIZONTAL);
    play_speed.setSensitivity(1);
    play_speed.setShowArcOnly(false);
    play_speed.setOverArcOnly(false);
    play_speed.setIncludeOverBezel(false);
    play_speed.setShowTrack(true);
    play_speed.setLimits(0.0, 0.0, 10.0);
    play_speed.setNbrTicks(10);
    play_speed.setStickToTicks(true);
    play_speed.setShowTicks(true);
    play_speed.setOpaque(false);
    play_speed.addEventHandler(this, "play_speed_turn1");
    speed_label = new GLabel(gui_window, 58, 174, 107, 20);
    speed_label.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
    speed_label.setText("Animation Speed");
    speed_label.setOpaque(false);
    gui_window.loop();
}

// Variable declarations 
// autogenerated do not edit
GWindow gui_window;
GCustomSlider amplitude_slider; 
GLabel amplitude_label; 
GCustomSlider water_slider; 
GLabel water_label; 
GKnob play_speed; 
GLabel speed_label; 