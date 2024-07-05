// Setup section
(Begin)
    // Initialize the screen address
    @24575
    D=A
    @screen_current
    M=D
    
    // Initialize the keyboard address
    @24576
    D=A
    @keyboard
    M=D

(Loop)
    // Check keyboard input
    @keyboard
    A=M
    D=M
    @Draw
    D;JNE   // If a key is pressed (D != 0), jump to Draw
    @Clear
    0;JMP   // Otherwise, jump to Clear

// Fill the screen
(Draw)
    @24575
    D=A
    @screen_current
    M=D    // Reset screen_current to the last address

(FillLoop)
    @screen_current
    A=M
    M=-1   // Set the screen pixel to black (1)

    @screen_current
    M=M-1   // Decrement screen_current

    @16384
    D=A
    @screen_current
    D=M-D  // Check if we have reached the beginning of the screen
    @FillLoop
    D;JGE   // Continue filling if screen_current >= 16384

    @Loop
    0;JMP   // Return to the main loop

// Clear the screen
(Clear)
    @24575
    D=A
    @screen_current
    M=D    // Reset screen_current to the last address

(ClearLoop)
    @screen_current
    A=M
    M=0    // Set the screen pixel to white (0)

    @screen_current
    M=M-1   // Decrement screen_current

    @16384
    D=A
    @screen_current
    D=M-D  // Check if we have reached the beginning of the screen
    @ClearLoop
    D;JGE   // Continue clearing if screen_current >= 16384

    @Loop
    0;JMP   // Return to the main loop
