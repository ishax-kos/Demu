module demu.main;
// import display;



const SCREEN_WIDTH = 1024;
const SCREEN_HEIGHT = 720;


void update(){

}


void main() {
    auto display = displayStart(SCREEN_WIDTH, SCREEN_HEIGHT);
    
    while (get_displayNotExit()) {
        update();
    }

    displayExit(display);
}

