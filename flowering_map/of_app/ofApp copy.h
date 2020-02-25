#pragma once

#include "ofMain.h"

class ofApp : public ofBaseApp{
	public:
		void setup();
		void update();
		void draw();
		
		void keyPressed(int key);
		void keyReleased(int key);
		void mouseMoved(int x, int y);
		void mouseDragged(int x, int y, int button);
		void mousePressed(int x, int y, int button);
		void mouseReleased(int x, int y, int button);
		void mouseEntered(int x, int y);
		void mouseExited(int x, int y);
		void windowResized(int w, int h);
		void dragEvent(ofDragInfo dragInfo);
		void gotMessage(ofMessage msg);
    
        void erase();
    
        ofImage bgImg;
        ofImage fl;
        ofImage fr;
    bool jan = false;
    bool feb = false, mar = false, apr = false, may = false, jun = false, jul = false, aug = false, sep = false, oct = false, nov = false, dec = false;
    
};
