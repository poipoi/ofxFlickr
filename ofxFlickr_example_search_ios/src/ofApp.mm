#include "ofApp.h"


// REPLACE THESE WITH YOUR API KEY AND API SECRET
// http://www.flickr.com/services/developer/

string API_KEY = "";
string API_SECRET = "";

//--------------------------------------------------------------
void ofApp::setup(){
    flickrAPI.start();      // Start auth thread.
    flickrAPI.authenticate( API_KEY, API_SECRET, ofxFlickr::FLICKR_WRITE, ofxiOSGetDocumentsDirectory() );  // Set ios dir.
    
    results = flickrAPI.search("openframeworks");
    currentResult = 0;
    lastChanged = ofGetElapsedTimeMillis();
    
    if ( results.size() > 0){
        latestImage.loadImage(results[currentResult].getURL());
    }
}

//--------------------------------------------------------------
void ofApp::update(){
    if ( ofGetElapsedTimeMillis() - lastChanged > 1000 ){
        lastChanged = ofGetElapsedTimeMillis();
        currentResult++;
        if ( currentResult >= results.size()){
            currentResult = 0;
        }
        
        if ( results.size() > 0){
            latestImage.loadImage(results[currentResult].getURL());
        }
    }
}

//--------------------------------------------------------------
void ofApp::draw(){
    if ( latestImage.bAllocated() ){
        latestImage.draw(0,0);
    }
}

//--------------------------------------------------------------
void ofApp::exit(){

}

//--------------------------------------------------------------
void ofApp::touchDown(ofTouchEventArgs & touch){

}

//--------------------------------------------------------------
void ofApp::touchMoved(ofTouchEventArgs & touch){

}

//--------------------------------------------------------------
void ofApp::touchUp(ofTouchEventArgs & touch){

}

//--------------------------------------------------------------
void ofApp::touchDoubleTap(ofTouchEventArgs & touch){

}

//--------------------------------------------------------------
void ofApp::touchCancelled(ofTouchEventArgs & touch){
    
}

//--------------------------------------------------------------
void ofApp::lostFocus(){

}

//--------------------------------------------------------------
void ofApp::gotFocus(){

}

//--------------------------------------------------------------
void ofApp::gotMemoryWarning(){

}

//--------------------------------------------------------------
void ofApp::deviceOrientationChanged(int newOrientation){

}
